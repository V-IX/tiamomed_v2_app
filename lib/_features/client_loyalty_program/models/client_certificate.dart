import 'package:json_annotation/json_annotation.dart';

part 'client_certificate.g.dart';

@JsonSerializable()
class ClientCertificate {
  ClientCertificate({
    required this.startDate,
    required this.endDate,
    required this.initialBalance,
    required this.currentBalance,
    required this.barcode,
  });

  factory ClientCertificate.fromJson(Map<String, dynamic> json) => _$ClientCertificateFromJson(json);
  Map<String, dynamic> toJson() => _$ClientCertificateToJson(this);

  @JsonKey(name: 'end_date')
  final String endDate;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'sum')
  final String initialBalance;
  @JsonKey(name: 'remains')
  final String currentBalance;
  @JsonKey(name: 'barcode')
  final String barcode;

  static ClientCertificate fake() => ClientCertificate(
    startDate: '2023-12-31',
    endDate: '2023-12-31',
    initialBalance: '1000',
    currentBalance: '500',
    barcode: '3006480638297',
  );
}
