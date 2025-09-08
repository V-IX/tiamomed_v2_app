// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewAppointment _$NewAppointmentFromJson(Map<String, dynamic> json) =>
    NewAppointment(
      name: json['name'] as String,
      bday: json['bday'] as String,
      phone: json['phone'] as String,
      cabinet: json['cabinet'] as String,
      sotrudnik: json['specialist'] as String,
      uslugi: json['services'] as String,
      dateTime: json['datetime'] as String,
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$NewAppointmentToJson(NewAppointment instance) =>
    <String, dynamic>{
      'name': instance.name,
      'bday': instance.bday,
      'phone': instance.phone,
      'cabinet': instance.cabinet,
      'specialist': instance.sotrudnik,
      'services': instance.uslugi,
      'datetime': instance.dateTime,
      'comment': instance.comment,
    };
