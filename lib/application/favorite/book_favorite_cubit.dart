import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:readly/domain/entities/book.dart';

import 'package:equatable/equatable.dart';

class BookFavoriteState extends Equatable {
  final bool isFavorite;

  const BookFavoriteState({required this.isFavorite});

  @override
  List<Object?> get props => [isFavorite];
}

class BookFavoriteCubit extends Cubit<BookFavoriteState> {
  final Box<Book> favoritesBox;
  final Book book;

  BookFavoriteCubit({required this.favoritesBox, required this.book})
      : super(BookFavoriteState(
            isFavorite: favoritesBox.values.any((b) => b.id == book.id)));

  void toggleFavorite() {
    final isFav = favoritesBox.values.any((b) => b.id == book.id);
    if (isFav) {
      final index =
          favoritesBox.values.toList().indexWhere((b) => b.id == book.id);
      if (index != -1) {
        favoritesBox.deleteAt(index);
        emit(BookFavoriteState(isFavorite: false));
      }
    } else {
      final copiedBook = Book(
        id: book.id,
        title: book.title,
        year: book.year,
        publisher: book.publisher,
        isbn: book.isbn,
        pages: book.pages,
        notes: List<String>.from(book.notes),
        createdAt: book.createdAt,
        villains: List<String>.from(book.villains),
      );

      favoritesBox.add(copiedBook);
      emit(BookFavoriteState(isFavorite: true));
    }
  }
}
