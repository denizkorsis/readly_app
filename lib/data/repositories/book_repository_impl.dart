import 'package:hive/hive.dart';
import 'package:readly/domain/entities/book.dart';
import 'package:readly/domain/repositories/book_repository.dart';
import '../datasources/book_api_service.dart';

class BookRepositoryImpl implements BookRepository {
  final BookApiService apiService;

  BookRepositoryImpl({required this.apiService});

  @override
  Future<List<Book>> getBooks() async {
    final bookModels = await apiService.fetchBooks();
    final books = bookModels.map((e) => e.toEntity()).toList();

    // Hive box'ı aç
    final box = await Hive.openBox<Book>('books');

    // Eski verileri temizle
    await box.clear();

    // Yeni kitapları ekle
    await box.addAll(books);

    return books;
  }

  @override
  Future<List<Book>> getCachedBooks() async {
    final box = await Hive.openBox<Book>('booksBox');
    return box.values.toList(); // tüm kitapları getir
  }
}
