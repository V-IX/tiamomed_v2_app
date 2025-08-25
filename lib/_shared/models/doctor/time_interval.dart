import 'package:json_annotation/json_annotation.dart';

part 'time_interval.g.dart';

@JsonSerializable()
class TimeInterval {
  const TimeInterval({
    required this.kod,
    required this.name,
    required this.timeN,
    required this.timeK
  });


  factory TimeInterval.fromJson(Map<String, dynamic> json) => _$TimeIntervalFromJson(json);

  @JsonKey(name: 'Kod')
  final String kod;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'TimeN')
  final String timeN;
  @JsonKey(name: 'TimeK')
  final String timeK;

  @override
  bool operator == (Object other) {
    return other is TimeInterval && other.kod == kod;
  }

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + kod.hashCode;
    return result;
  }

}
