// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorService _$DoctorServiceFromJson(Map<String, dynamic> json) =>
    DoctorService(
      id: json['Kod'] as String,
      name: json['Name'] as String,
      time: json['Time'] as String? ?? '0',
      doctorServiceType: DoctorService._fromJsonToDoctorServiceType(
        json['VidDeyatelnosti'],
      ),
      count: json['Kolvo'] as String? ?? '0',
      period: json['Period'] as String? ?? '0',
      comment: json['Comment'] as String? ?? '',
      isActive: json['Active'] as String? ?? '0',
      price: json['Price'] as String? ?? '0.00',
      additionalServices: DoctorService._fromJsonToAdditionalServices(
        json['arrUsluga'],
      ),
    );

Map<String, dynamic> _$DoctorServiceToJson(DoctorService instance) =>
    <String, dynamic>{
      'Kod': instance.id,
      'Name': instance.name,
      'Time': instance.time,
      'VidDeyatelnosti': instance.doctorServiceType,
      'Kolvo': instance.count,
      'Period': instance.period,
      'Comment': instance.comment,
      'Active': instance.isActive,
      'Price': instance.price,
      'arrUsluga': instance.additionalServices,
    };
