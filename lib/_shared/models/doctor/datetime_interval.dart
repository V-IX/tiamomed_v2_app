import 'package:json_annotation/json_annotation.dart';
import 'time_interval.dart';

part 'datetime_interval.g.dart';

@JsonSerializable()
class DateTimeInterval {
  const DateTimeInterval({
    required this.date,
    required this.timeInterval
  });


  factory DateTimeInterval.fromJson(Map<String, dynamic> json) => _$DateTimeIntervalFromJson(json);

  @JsonKey(name: 'Date')
  final String date;
  @JsonKey(name: 'TimeInterval')
  final TimeInterval timeInterval;


  @override
  bool operator == (Object other) {
    return other is DateTimeInterval && other.date == date && other.timeInterval == timeInterval;
  }

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + date.hashCode;
    result = 37 * result + timeInterval.hashCode;
    return result;
  }


}


