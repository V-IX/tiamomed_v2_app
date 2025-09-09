import 'package:json_annotation/json_annotation.dart';
import 'client_bonuses_history_item.dart';

part 'client_bonuses_history.g.dart';

@JsonSerializable()
class ClientBonusesHistory {
  ClientBonusesHistory({
    required this.countCommon,
    required this.countBirthday,
    required this.sum,
    required this.history,
  });

  factory ClientBonusesHistory.fromJson(Map<String, dynamic> json) => _$ClientBonusesHistoryFromJson(json);
  Map<String, dynamic> toJson() => _$ClientBonusesHistoryToJson(this);

  @JsonKey(name: 'count')
  final double countCommon;
  @JsonKey(name: 'count_birthday')
  final double countBirthday;
  @JsonKey(name: 'sum')
  final double sum;
  @JsonKey(name: 'history')
  final List<ClientBonusesHistoryItem> history;


}
