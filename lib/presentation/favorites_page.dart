import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:readly/application/bottom_nav/bottom_nav_cubit.dart';
import 'package:readly/core/l10n/locale_keys.g.dart';
import 'package:readly/domain/entities/book.dart';
import 'package:readly/presentation/widgets/book_card.dart';
import 'package:readly/presentation/widgets/custom_app_bar.dart';
import 'package:readly/presentation/widgets/custom_bottom_nav_bar.dart';
import 'book_detail_page.dart';
import 'package:readly/core/utils/extensions/locale_extension.dart';

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
          CustomAppBar(
            title: LocaleKeys.favorites.locale,
          ),
          Expanded(
            child: uniqueFavorites.isEmpty
                ? Center(child: Text(LocaleKeys.no_favorites.locale))
                : GridView.builder(
                    padding: EdgeInsets.all(12.r),
                    itemCount: uniqueFavorites.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.75,
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
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
