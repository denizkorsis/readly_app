import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:readly/application/favorite/book_favorite_cubit.dart';
import 'package:readly/domain/entities/book.dart';

class MockFavoritesBox extends Mock implements Box<Book> {}

class FakeBook extends Fake implements Book {}

void main() {
  late MockFavoritesBox mockBox;
  late Book testBook;

  setUpAll(() {
    registerFallbackValue(FakeBook());
  });

  setUp(() {
    mockBox = MockFavoritesBox();
    testBook = Book(
      createdAt: DateTime.now(),
      id: 1,
      title: 'It',
      publisher: 'Viking',
      year: 1986,
      isbn: '1234567890',
      pages: 1138,
      notes: ['Scary'],
      villains: ['Pennywise'],
    );
  });

  blocTest<BookFavoriteCubit, BookFavoriteState>(
    'toggleFavorite adds book if not favorite, then removes',
    build: () {
      List<Book> mockValues = [];

      when(() => mockBox.values).thenAnswer((_) => mockValues);
      when(() => mockBox.add(any())).thenAnswer((_) async {
        mockValues = [testBook]; //Kitabı favorilere ekler
        return 0;
      });
      when(() => mockBox.deleteAt(any())).thenAnswer((_) async {
        mockValues = []; //Kitabın favorilerden çıakrılmasını sağlar
      });

      return BookFavoriteCubit(favoritesBox: mockBox, book: testBook);
    },
    act: (cubit) async {
      cubit.toggleFavorite(); //Önce kitabı favorilere ekler
      cubit.toggleFavorite(); //Sonra favorilerden çıkarır
    },
    expect: () => [
      const BookFavoriteState(isFavorite: true),
      const BookFavoriteState(isFavorite: false),
    ],
  );
}
