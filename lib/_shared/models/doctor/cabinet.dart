import 'package:json_annotation/json_annotation.dart';

import 'additional_info.dart';

part 'cabinet.g.dart';

@JsonSerializable()
class Cabinet {
  Cabinet({
    required this.id,
    required this.name,
    required this.filial
  });

  factory Cabinet.fromJson(Map<String, dynamic> json) => _$CabinetFromJson(json);

  @JsonKey(name: 'Kod')
  final String id;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Filial')
  final AdditionalInfo filial;

}
