import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readly/core/constants/asset_constants/image_paths.dart';
import 'package:readly/core/theme/colors.dart';
import 'package:readly/domain/entities/book.dart';
import 'package:readly/presentation/book_detail_page.dart';

class BookCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            Navigator.push(
              context,
              MaterialPageRoute<BookDetailPage>(
                builder: (_) => BookDetailPage(book: book),
              ),
            );
          },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 110.h,
              width: double.infinity,
              child: Image.asset(
                ImagePaths.book,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              book.title,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.h),
            Text(
              '${book.year} • ${book.publisher}',
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
                Text(
                  '${book.pages} sayfa',
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                ),
                if (onDelete != null)
                  IconButton(
                    icon: Icon(Icons.delete_sharp,
                        color: AppColors.redWeigher, size: 18.sp),
                    onPressed: onDelete,
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
