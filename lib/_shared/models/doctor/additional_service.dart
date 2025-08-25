import 'package:json_annotation/json_annotation.dart';

import 'doctor_service.dart';
import 'doctor_service_type.dart';

part 'additional_service.g.dart';

@JsonSerializable()
class AdditionalService {
  AdditionalService({
    required this.service,
    required this.count,
  });

  factory AdditionalService.fromJson(Map<String, dynamic> json) => _$AdditionalServiceFromJson(json);


  @JsonKey(name: 'Kolvo')
  final String count;
  @JsonKey(name: 'Usluga')
  final DoctorService service;


}


