import 'package:json_annotation/json_annotation.dart';

part 'client_bonuses_history_item.g.dart';

@JsonSerializable()
class ClientBonusesHistoryItem {
  ClientBonusesHistoryItem({
    required this.date,
    required this.text,
    required this.count,
  });

  factory ClientBonusesHistoryItem.fromJson(Map<String, dynamic> json) => _$ClientBonusesHistoryItemFromJson(json);
  Map<String, dynamic> toJson() => _$ClientBonusesHistoryItemToJson(this);

  @JsonKey(name: 'date')
  final String date;
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'count')
  final double count;

  static List<ClientBonusesHistoryItem> fakeList = [];
}
