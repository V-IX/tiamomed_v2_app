part of 'additional_info.dart';

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) =>
    AdditionalInfo(kod: json['Kod'] as String, name: json['Name'] as String);

Map<String, dynamic> _$AdditionalInfoToJson(AdditionalInfo instance) =>
    <String, dynamic>{'Kod': instance.kod, 'Name': instance.name};
