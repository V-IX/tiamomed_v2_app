import 'package:json_annotation/json_annotation.dart';

part 'client_info.g.dart';

@JsonSerializable()
class ClientInfo {
  ClientInfo({
    required this.surname,
    required this.registrationAddress,
    required this.citizenship,
    required this.email,
    required this.instagram,
  });

  factory ClientInfo.fromJson(Map<String, dynamic> json) => _$ClientInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ClientInfoToJson(this);

  @JsonKey(name: 'surname', defaultValue: '')
  final String surname;
  @JsonKey(name: 'registration_form', defaultValue: '')
  final String registrationAddress;
  @JsonKey(name: 'citizenship', defaultValue: '')
  final String citizenship;
  @JsonKey(name: 'email', defaultValue: '')
  final String email;
  @JsonKey(name: 'instagram', defaultValue: '')
  final String instagram;

}
