// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cabinet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cabinet _$CabinetFromJson(Map<String, dynamic> json) => Cabinet(
  id: json['Kod'] as String,
  name: json['Name'] as String,
  filial: AdditionalInfo.fromJson(json['Filial'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CabinetToJson(Cabinet instance) => <String, dynamic>{
  'Kod': instance.id,
  'Name': instance.name,
  'Filial': instance.filial,
};
