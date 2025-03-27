import '../entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
  Future<List<Book>> getCachedBooks(); // Yerelden çeker
}
