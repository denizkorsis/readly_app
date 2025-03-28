import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:readly/core/constants/asset_constants/image_paths.dart';
import 'package:readly/core/notifications/notification_service.dart';
import 'package:readly/domain/entities/book.dart';

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

  void toggleFavorite() async {
    setState(() => isFavorite = !isFavorite);

    if (isFavorite) {
      await favoritesBox.add(widget.book);
      _showSnack('Favorilere eklendi');
    } else {
      final toRemove = favoritesBox.values.firstWhere(
        (b) => b.id == widget.book.id,
        orElse: () => throw Exception('Favorilerde bulunamadı'),
      );
      await toRemove.delete();
      _showSnack('Favorilerden kaldırıldı');
    }
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), behavior: SnackBarBehavior.floating),
    );
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          book.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: toggleFavorite,
          ),
          if (isFavorite)
            IconButton(
              icon: const Icon(
                Icons.notifications_active_outlined,
              ),
              onPressed: () {
                NotificationService.scheduleDailyNotification(
                  id: book.id,
                  title: 'Kitap Hatırlatma!',
                  body: '${book.title} kitabını okumayı unutma!',
                );
                _showSnack('Hatırlatma ayarlandı');
              },
            )
          else
            const SizedBox.shrink(),
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
            const SizedBox(height: 20),

            /// DETAYLAR BLOĞU
            _buildInfoRow('Yayınevi', book.publisher),
            _buildInfoRow('Yıl', book.year.toString()),
            _buildInfoRow('ISBN', book.isbn),
            _buildInfoRow('Sayfa Sayısı', book.pages.toString()),

            const SizedBox(height: 24),

            /// NOTLAR
            Text('Notlar', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            ...book.notes.map((e) => _bulletItem(e)),

            const SizedBox(height: 20),

            /// VİLLAİNS
            Text('Villains', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            ...book.villains.map((e) => _bulletItem(e)),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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

  Widget _bulletItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 18)),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
