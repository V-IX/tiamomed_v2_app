import 'package:json_annotation/json_annotation.dart';

part 'client_season_ticket_service.g.dart';

@JsonSerializable()
class ClientSeasonTicketService {
  ClientSeasonTicketService({
    required this.title,
    required this.count
  });

  factory ClientSeasonTicketService.fromJson(Map<String, dynamic> json) => _$ClientSeasonTicketServiceFromJson(json);
  Map<String, dynamic> toJson() => _$ClientSeasonTicketServiceToJson(this);

  @JsonKey(name: 'service')
  final String title;
  @JsonKey(name: 'count')
  final String count;
}