import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:readly/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:readly/domain/entities/book.dart';
import 'package:readly/presentation/widgets/book_card.dart';
import 'package:readly/presentation/widgets/custom_app_bar.dart';
import 'package:readly/presentation/widgets/custom_bottom_nav_bar.dart';
import 'book_detail_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Box<Book> favoritesBox;
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box<Book>('favoritesBox');
  }

  @override
  Widget build(BuildContext context) {
    final uniqueFavorites = <int, Book>{
      for (var book in favoritesBox.values) book.id: book
    }.values.toList();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Favoriler',
          ),
          Expanded(
            child: uniqueFavorites.isEmpty
                ? const Center(child: Text('Henüz favori kitap yok.'))
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GridView.builder(
                      padding: EdgeInsets.only(top: 16.h),
                      itemCount: uniqueFavorites.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 0.68,
                      ),
                      itemBuilder: (context, index) {
                        final book = uniqueFavorites[index];
                        return BookCard(
                          book: book,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => BookDetailPage(book: book),
                              ),
                            );
                          },
                          onDelete: () async {
                            final matching = favoritesBox.values
                                .where((b) => b.id == book.id)
                                .toList();
                            for (var item in matching) {
                              await item.delete();
                            }
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      '${book.title} favorilerden silindi')),
                            );
                          },
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
