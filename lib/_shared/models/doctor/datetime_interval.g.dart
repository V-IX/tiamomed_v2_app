// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datetime_interval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTimeInterval _$DateTimeIntervalFromJson(Map<String, dynamic> json) =>
    DateTimeInterval(
      date: json['Date'] as String,
      timeInterval: TimeInterval.fromJson(
        json['TimeInterval'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$DateTimeIntervalToJson(DateTimeInterval instance) =>
    <String, dynamic>{
      'Date': instance.date,
      'TimeInterval': instance.timeInterval,
    };
