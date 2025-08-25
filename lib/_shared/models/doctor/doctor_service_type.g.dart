// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_service_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorServiceType _$DoctorServiceTypeFromJson(Map<String, dynamic> json) =>
    DoctorServiceType(
      id: json['Kod'] as String,
      name: json['Name'] as String,
      period: json['Period'] as String? ?? '',
      season: json['Sezon'] as String? ?? '',
      effectDuration: json['DlitelnostEffect'] as String? ?? '',
    );

Map<String, dynamic> _$DoctorServiceTypeToJson(DoctorServiceType instance) =>
    <String, dynamic>{
      'Kod': instance.id,
      'Name': instance.name,
      'Period': instance.period,
      'Sezon': instance.season,
      'DlitelnostEffect': instance.effectDuration,
    };
