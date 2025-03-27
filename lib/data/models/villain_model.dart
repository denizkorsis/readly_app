import 'package:json_annotation/json_annotation.dart';
part 'villain_model.g.dart';

@JsonSerializable()
class VillainModel {
  final String name;
  final String url;

  VillainModel({
    required this.name,
    required this.url,
  });

  factory VillainModel.fromJson(Map<String, dynamic> json) =>
      _$VillainModelFromJson(json);

  Map<String, dynamic> toJson() => _$VillainModelToJson(this);

  static List<VillainModel> listFromJson(List<dynamic> json) => json
      .map((e) => VillainModel.fromJson(e as Map<String, dynamic>))
      .toList();

  static List<Map<String, dynamic>> listToJson(List<VillainModel> villains) =>
      villains.map((e) => e.toJson()).toList();
}
