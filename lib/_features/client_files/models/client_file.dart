import 'package:json_annotation/json_annotation.dart';

part 'client_file.g.dart';

@JsonSerializable()
class ClientFile {
  ClientFile({required this.name, required this.modified, required this.size});

  factory ClientFile.fromJson(Map<String, dynamic> json) => _$ClientFileFromJson(json);
  Map<String, dynamic> toJson() => _$ClientFileToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'modified')
  final String modified;
  @JsonKey(name: 'size')
  final int size;
}
