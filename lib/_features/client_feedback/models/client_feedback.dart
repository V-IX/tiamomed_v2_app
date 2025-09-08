import 'package:json_annotation/json_annotation.dart';

part 'client_feedback.g.dart';

@JsonSerializable()
class ClientFeedback {
  ClientFeedback({
    required this.id,
    required this.date,
    required this.rating,
    required this.text,
    required this.imagesUrl,
  });

  factory ClientFeedback.fromJson(Map<String, dynamic> json) => _$ClientFeedbackFromJson(json);
  Map<String, dynamic> toJson() => _$ClientFeedbackToJson(this);

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'created_at')
  final String date;
  @JsonKey(name: 'estimation')
  final int rating;
  @JsonKey(name: 'text', defaultValue: '')
  final String text;
  @JsonKey(name: 'images', defaultValue: <String>[])
  final List<String> imagesUrl;

}
