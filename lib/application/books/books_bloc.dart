import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:readly/core/l10n/locale_keys.g.dart';
import 'package:readly/domain/repositories/book_repository.dart';
import 'package:readly/domain/entities/book.dart';
import 'books_event.dart';
import 'books_state.dart';
import 'package:readly/core/utils/extensions/locale_extension.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BookRepository repository;
  List<Book> _allBooks = [];

  BooksBloc({required this.repository}) : super(BooksInitial()) {
    on<FetchBooks>((event, emit) async {
      emit(BooksLoading());
      try {
        _allBooks = await repository.getBooks();
        final box = await Hive.openBox<Book>('booksBox');
        await box.clear();
        for (var book in _allBooks) {
          await box.add(Book(
            id: book.id,
            title: book.title,
            year: book.year,
            publisher: book.publisher,
            isbn: book.isbn,
            pages: book.pages,
            notes: List<String>.from(book.notes),
            createdAt: book.createdAt,
            villains: List<String>.from(book.villains),
          ));
        }

        emit(BooksLoaded(_allBooks));
      } catch (e) {
        // API'den çekilemezse cache'ten dene
        final cachedBooks = await repository.getCachedBooks();
        if (cachedBooks.isNotEmpty) {
          emit(BooksLoaded(cachedBooks));
        } else {
          emit(BooksError('${LocaleKeys.books_load_error.locale} $e'));
        }
      }
    });
    on<SearchBooks>((event, emit) {
      final filtered = _allBooks
          .where((book) =>
              book.title.toLowerCase().contains(event.query.toLowerCase()))
          .toList();

      emit(BooksLoaded(filtered));
    });
  }
}
