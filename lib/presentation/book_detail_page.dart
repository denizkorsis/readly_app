import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      // Favorilere ekle
      await favoritesBox.add(Book(
        id: widget.book.id,
        title: widget.book.title,
        year: widget.book.year,
        publisher: widget.book.publisher,
        isbn: widget.book.isbn,
        pages: widget.book.pages,
        notes: List<String>.from(widget.book.notes),
        createdAt: widget.book.createdAt,
        villains: List<String>.from(widget.book.villains),
      ));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Favorilere eklendi')),
      );
    } else {
      // Favorilerden kaldır
      final toRemove = favoritesBox.values.firstWhere(
        (b) => b.id == widget.book.id,
        orElse: () => throw Exception('Favorilerde bulunamadı'),
      );
      await toRemove.delete();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Favorilerden kaldırıldı')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Yıl: ${book.year}',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Yayınevi: ${book.publisher}'),
            const SizedBox(height: 8),
            Text('ISBN: ${book.isbn}'),
            const SizedBox(height: 8),
            Text('Sayfa Sayısı: ${book.pages}'),
            const SizedBox(height: 16),
            Text('Notlar:', style: Theme.of(context).textTheme.titleMedium),
            ...book.notes.map((note) => Text('- $note')).toList(),
            const SizedBox(height: 16),
            Text('Villains:', style: Theme.of(context).textTheme.titleMedium),
            ...book.villains.map((v) => Text('- $v')).toList(),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: toggleFavorite,
              child:
                  Text(isFavorite ? 'Favorilerden Kaldır' : 'Favorilere Ekle'),
            ),
            if (isFavorite)
              ElevatedButton(
                onPressed: () {
                  NotificationService.scheduleDailyNotification(
                    id: widget.book.id,
                    title: 'Kitap Hatırlatma!',
                    body: '${widget.book.title} kitabını okumayı unutma!',
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Hatırlatma ayarlandı')),
                  );
                },
                child: const Text('Hatırlat'),
              )
            else
              const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
