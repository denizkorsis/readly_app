import 'package:equatable/equatable.dart';

abstract class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object?> get props => [];
}

class FetchBooks extends BooksEvent {}

class SearchBooks extends BooksEvent {
  final String query;

  SearchBooks(this.query);
}
