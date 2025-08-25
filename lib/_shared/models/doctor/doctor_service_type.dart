import 'package:json_annotation/json_annotation.dart';

part 'doctor_service_type.g.dart';

@JsonSerializable()
class DoctorServiceType {
  DoctorServiceType({
    required this.id,
    required this.name,
    required this.period,
    required this.season,
    required this.effectDuration
  });

  factory DoctorServiceType.fromJson(Map<String, dynamic> json) => _$DoctorServiceTypeFromJson(json);


  @JsonKey(name: 'Kod')
  final String id;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Period', defaultValue: '')
  final String period;
  @JsonKey(name: 'Sezon', defaultValue: '')
  final String season;
  @JsonKey(name: 'DlitelnostEffect', defaultValue: '')
  final String effectDuration;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DoctorServiceType &&
              runtimeType == other.runtimeType &&
              id == other.id;// Добавлено сра

  @override
  int get hashCode => Object.hash(id, 16);

}