import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:readly/application/favorite/book_favorite_cubit.dart';
import 'package:readly/core/constants/asset_constants/image_paths.dart';
import 'package:readly/core/l10n/locale_keys.g.dart';
import 'package:readly/core/notifications/notification_service.dart';
import 'package:readly/domain/entities/book.dart';
import 'package:readly/core/utils/extensions/locale_extension.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;

  const BookDetailPage({super.key, required this.book});
  factory BookDetailPage.fromBookId(int bookId) {
    final box = Hive.box<Book>('favoritesBox');
    final book = box.values.firstWhere((b) => b.id == bookId);
    return BookDetailPage(book: book);
  }
  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  late Box<Book> favoritesBox;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box<Book>('favoritesBox');
    isFavorite = favoritesBox.values.any((b) => b.id == widget.book.id);
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return BlocProvider(
      create: (_) => BookFavoriteCubit(
          favoritesBox: Hive.box<Book>('favoritesBox'), book: book),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            book.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            BlocBuilder<BookFavoriteCubit, BookFavoriteState>(
              builder: (context, state) {
                return IconButton(
                  icon: Icon(
                    state.isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: state.isFavorite ? Colors.red : null,
                  ),
                  onPressed: () =>
                      context.read<BookFavoriteCubit>().toggleFavorite(),
                );
              },
            ),
            BlocBuilder<BookFavoriteCubit, BookFavoriteState>(
              builder: (context, state) {
                if (!state.isFavorite) return const SizedBox.shrink();
                return IconButton(
                  icon: const Icon(Icons.notifications_active_outlined),
                  onPressed: () {
                    NotificationService.scheduleDailyNotification(
                      id: book.id,
                      title: LocaleKeys.book_reminder.locale,
                      body: '${book.title} ${LocaleKeys.reminder_body.locale}',
                    );
                    NotificationService.showNotification(
                      id: book.id,
                      title: LocaleKeys.book_reminder.locale,
                      body: '${book.title} ${LocaleKeys.reminder_body.locale}',
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(LocaleKeys.reminder_set.locale)),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    ImagePaths.book,
                    width: 240.w,
                    height: 240.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              /// DETAYLAR BLOĞU
              _buildInfoRow(LocaleKeys.publisher.locale, book.publisher),
              _buildInfoRow(LocaleKeys.year.locale, book.year.toString()),
              _buildInfoRow('ISBN', book.isbn),
              _buildInfoRow(LocaleKeys.pages.locale, book.pages.toString()),

              const SizedBox(height: 24),

              /// NOTLAR
              Text(LocaleKeys.notes.locale,
                  style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: book.notes.map((note) => _tagBox(note)).toList(),
              ),

              SizedBox(height: 24.h),

              /// VİLLAİNS
              Text('Villains', style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 10.h),
              Wrap(
                spacing: 8.h,
                runSpacing: 8.h,
                children: book.villains
                    .map((v) => _tagBox(v, icon: Icons.person))
                    .toList(),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.w),
      child: Row(
        children: [
          Text(
            '$title: ',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Expanded(
            child: Text(
              value,
            ),
          ),
        ],
      ),
    );
  }

  Widget _tagBox(String text, {IconData? icon}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 18.sp, color: Colors.blueGrey),
            SizedBox(width: 6.w),
          ],
          Flexible(
            child: Text(
              text,
              style: TextStyle(fontSize: 13.sp),
            ),
          ),
        ],
      ),
    );
  }
}
