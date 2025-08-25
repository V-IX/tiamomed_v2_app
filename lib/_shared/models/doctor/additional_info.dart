import 'package:json_annotation/json_annotation.dart';

part 'additional_info.g.dart';

@JsonSerializable()
class AdditionalInfo {

  AdditionalInfo({required this.kod, required this.name});
  factory AdditionalInfo.fromJson(Map<String, dynamic> json) => _$AdditionalInfoFromJson(json);

  static AdditionalInfo empty = AdditionalInfo(kod: '', name: '');

  @JsonKey(name: 'Kod')
  final String kod;
  @JsonKey(name: 'Name')
  final String name;

}