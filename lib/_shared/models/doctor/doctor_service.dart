import 'package:json_annotation/json_annotation.dart';

import '../../../utils/other/from_json_to_list.dart';
import 'additional_service.dart';
import 'doctor_service_type.dart';

part 'doctor_service.g.dart';

@JsonSerializable()
class DoctorService {
  DoctorService({
    required this.id,
    required this.name,
    required this.time,
    required this.doctorServiceType,
    required this.count,
    required this.period,
    required this.comment,
    required this.isActive,
    required this.price,
    required this.additionalServices,
  });

  factory DoctorService.fromJson(Map<String, dynamic> json) => _$DoctorServiceFromJson(json);

  @JsonKey(name: 'Kod')
  final String id;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Time', defaultValue: '0')
  final String time;
  @JsonKey(name: 'VidDeyatelnosti', fromJson: _fromJsonToDoctorServiceType)
  final DoctorServiceType? doctorServiceType;
  @JsonKey(name: 'Kolvo', defaultValue: '0')
  final String count;
  @JsonKey(name: 'Period', defaultValue: '0')
  final String period;
  @JsonKey(name: 'Comment', defaultValue: '')
  final String comment;
  @JsonKey(name: 'Active', defaultValue: '0')
  final String isActive;
  @JsonKey(name: 'Price', defaultValue: '0.00')
  final String price;
  @JsonKey(name: 'arrUsluga', fromJson: _fromJsonToAdditionalServices)
  final List<AdditionalService> additionalServices;

  static List<AdditionalService> _fromJsonToAdditionalServices(dynamic json) {
    return fromJsonToList(json: json, fromJsonMethod: AdditionalService.fromJson);
  }

  static DoctorServiceType? _fromJsonToDoctorServiceType(dynamic json) {
    return fromJsonToObjectOrNull(json: json, fromJsonMethod: DoctorServiceType.fromJson);
  }



  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DoctorService &&
              runtimeType == other.runtimeType &&
              id == other.id;// Добавлено сра

  @override
  int get hashCode => Object.hash(id, 16);


}


