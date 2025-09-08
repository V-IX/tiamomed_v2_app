import 'package:json_annotation/json_annotation.dart';

part 'client_service_category.g.dart';

@JsonSerializable()
class ClientServiceCategory {
  ClientServiceCategory({required this.id, required this.uid, required this.title, required this.text, required this.imageUrl});

  factory ClientServiceCategory.fromJson(Map<String, dynamic> json) => _$ClientServiceCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ClientServiceCategoryToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'uid')
  final String uid;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'img')
  final String imageUrl;
}