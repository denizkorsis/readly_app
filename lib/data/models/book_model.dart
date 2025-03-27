import 'package:json_annotation/json_annotation.dart';
import 'package:readly/data/models/villain_model.dart';
import '../../domain/entities/book.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel {
  final int id;

  @JsonKey(name: 'Title')
  final String title;

  @JsonKey(name: 'Year')
  final int year;

  @JsonKey(name: 'Publisher')
  final String publisher;

  @JsonKey(name: 'ISBN')
  final String isbn;

  @JsonKey(name: 'Pages')
  final int pages;

  @JsonKey(name: 'Notes')
  final List<String> notes;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(
    name: 'villains',
    fromJson: VillainModel.listFromJson,
    toJson: VillainModel.listToJson,
  )
  final List<VillainModel> villains;
  BookModel({
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

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookModelToJson(this);

  Book toEntity() => Book(
        id: id,
        title: title,
        year: year,
        publisher: publisher,
        isbn: isbn,
        pages: pages,
        notes: notes,
        createdAt: DateTime.parse(createdAt),
        villains: villains.map((v) => v.name).toList(),
      );
}
