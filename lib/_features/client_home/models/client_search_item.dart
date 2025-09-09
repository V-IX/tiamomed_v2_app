import 'package:json_annotation/json_annotation.dart';

part 'client_search_item.g.dart';

@JsonSerializable()
class ClientSearchItem {
  ClientSearchItem({required this.id, required this.title});

  factory ClientSearchItem.fromJson(Map<String, dynamic> json) => _$ClientSearchItemFromJson(json);
  Map<String, dynamic> toJson() => _$ClientSearchItemToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;

}
