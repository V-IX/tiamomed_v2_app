// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalService _$AdditionalServiceFromJson(Map<String, dynamic> json) =>
    AdditionalService(
      service: DoctorService.fromJson(json['Usluga'] as Map<String, dynamic>),
      count: json['Kolvo'] as String,
    );

Map<String, dynamic> _$AdditionalServiceToJson(AdditionalService instance) =>
    <String, dynamic>{'Kolvo': instance.count, 'Usluga': instance.service};
