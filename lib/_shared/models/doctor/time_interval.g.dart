// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_interval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeInterval _$TimeIntervalFromJson(Map<String, dynamic> json) => TimeInterval(
  kod: json['Kod'] as String,
  name: json['Name'] as String,
  timeN: json['TimeN'] as String,
  timeK: json['TimeK'] as String,
);

Map<String, dynamic> _$TimeIntervalToJson(TimeInterval instance) =>
    <String, dynamic>{
      'Kod': instance.kod,
      'Name': instance.name,
      'TimeN': instance.timeN,
      'TimeK': instance.timeK,
    };
