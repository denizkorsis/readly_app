import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:readly/core/constants/asset_constants/image_paths.dart';
import 'package:readly/core/l10n/locale_keys.g.dart';
import 'package:readly/core/theme/colors.dart';
import 'package:readly/domain/entities/book.dart';
import 'package:readly/presentation/book_detail_page.dart';
import 'package:readly/core/utils/extensions/locale_extension.dart';

class BookCard extends StatefulWidget {
  final Book book;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const BookCard({
    super.key,
    required this.book,
    this.onTap,
    this.onDelete,
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  late Box<Book> favoritesBox;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box<Book>('favoritesBox');
    isFavorite = favoritesBox.values.any((b) => b.id == widget.book.id);
  }

  void toggleFavorite() async {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      // Aynı nesneyi tekrar eklememek için kopya oluşturulmalı
      final bookCopy = Book(
        id: widget.book.id,
        title: widget.book.title,
        year: widget.book.year,
        publisher: widget.book.publisher,
        isbn: widget.book.isbn,
        pages: widget.book.pages,
        notes: List.from(widget.book.notes),
        villains: List.from(widget.book.villains),
        createdAt: widget.book.createdAt,
      );
      await favoritesBox.add(bookCopy);
    } else {
      final values = favoritesBox.values.where((b) => b.id == widget.book.id);
      if (values.isNotEmpty) {
        await values.first.delete();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute<BookDetailPage>(
                builder: (_) => BookDetailPage(book: widget.book),
              ),
            );
          },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(10.r),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 110.h,
                width: double.infinity,
                child: Image.asset(
                  ImagePaths.book,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                widget.book.title,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4.h),
              Text(
                '${widget.book.year} • ${widget.book.publisher}',
                style: TextStyle(
                  fontSize: 11.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${widget.book.pages} ${LocaleKeys.pages.locale}',
                      style: TextStyle(
                        fontSize: 11.sp,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  Row(
                    children: [
                      /// Favori butonu
                      IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.grey,
                          size: 18.sp,
                        ),
                        onPressed: toggleFavorite,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),

                      /// Silme varsa onu da göster
                      if (widget.onDelete != null)
                        IconButton(
                          icon: Icon(
                            Icons.delete_sharp,
                            color: AppColors.redWeigher,
                            size: 18.sp,
                          ),
                          onPressed: widget.onDelete,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
