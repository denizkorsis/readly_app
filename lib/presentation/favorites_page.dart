import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:readly/domain/entities/book.dart';
import 'book_detail_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Box<Book> favoritesBox;

  @override
  void initState() {
    super.initState();
    favoritesBox = Hive.box<Book>('favoritesBox');
  }

  @override
  Widget build(BuildContext context) {
    // Book.id'ye göre benzersiz favori kitapları listele
    final uniqueFavorites = <int, Book>{
      for (var book in favoritesBox.values) book.id: book
    }.values.toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favori Kitaplar')),
      body: uniqueFavorites.isEmpty
          ? const Center(child: Text('Henüz favori kitap yok.'))
          : ListView.builder(
              itemCount: uniqueFavorites.length,
              itemBuilder: (context, index) {
                final book = uniqueFavorites[index];
                return ListTile(
                  title: Text(book.title),
                  subtitle: Text('${book.year} - ${book.publisher}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () async {
                      // Tüm box'tan bu ID'ye ait tüm kayıtları kaldır
                      final matching = favoritesBox.values
                          .where((b) => b.id == book.id)
                          .toList();
                      for (var item in matching) {
                        await item.delete();
                      }

                      setState(() {}); // Sayfayı yenile
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('${book.title} favorilerden silindi')),
                      );
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BookDetailPage(book: book),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
