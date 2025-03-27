import 'package:hive/hive.dart';

part 'book.g.dart';

@HiveType(typeId: 0)
class Book extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final int year;

  @HiveField(3)
  final String publisher;

  @HiveField(4)
  final String isbn;

  @HiveField(5)
  final int pages;

  @HiveField(6)
  final List<String> notes;

  @HiveField(7)
  final DateTime createdAt;

  @HiveField(8)
  final List<String> villains;

  Book({
    required this.id,
    required this.title,
    required this.year,
    required this.publisher,
    required this.isbn,
    required this.pages,
    required this.notes,
    required this.createdAt,
    required this.villains,
  });
}
