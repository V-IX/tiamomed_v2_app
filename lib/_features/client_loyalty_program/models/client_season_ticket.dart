import 'package:json_annotation/json_annotation.dart';

import 'client_season_ticket_service.dart';

part 'client_season_ticket.g.dart';

@JsonSerializable()
class ClientSeasonTicket {
  ClientSeasonTicket({
    this.id = '',
    required this.validDate,
    required this.barcode,
    required this.services,
  });

  factory ClientSeasonTicket.fromJson(Map<String, dynamic> json) => _$ClientSeasonTicketFromJson(json);
  Map<String, dynamic> toJson() => _$ClientSeasonTicketToJson(this);

  @JsonKey(ignore: true)
  final String id;
  @JsonKey(name: 'end_date')
  final String validDate;

  @JsonKey(name: 'barcode')
  final String barcode;
  @JsonKey(name: 'services', defaultValue: <dynamic>[])
  final List<ClientSeasonTicketService> services;

  static ClientSeasonTicket fake() => ClientSeasonTicket(
    validDate: '2023-12-31',
    barcode: '2000000059259',
    services: <ClientSeasonTicketService>[]
  );
}


