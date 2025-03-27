// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: (json['id'] as num).toInt(),
      title: json['Title'] as String,
      year: (json['Year'] as num).toInt(),
      publisher: json['Publisher'] as String,
      isbn: json['ISBN'] as String,
      pages: (json['Pages'] as num).toInt(),
      notes: (json['Notes'] as List<dynamic>).map((e) => e as String).toList(),
      createdAt: json['created_at'] as String,
      villains: VillainModel.listFromJson(json['villains'] as List),
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'Title': instance.title,
      'Year': instance.year,
      'Publisher': instance.publisher,
      'ISBN': instance.isbn,
      'Pages': instance.pages,
      'Notes': instance.notes,
      'created_at': instance.createdAt,
      'villains': VillainModel.listToJson(instance.villains),
    };
