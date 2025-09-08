import 'package:json_annotation/json_annotation.dart';

part 'client_notification.g.dart';

@JsonSerializable()
class ClientNotification {
  ClientNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    required this.isRead,
  });

  factory ClientNotification.fromJson(Map<String, dynamic> json) =>
      _$ClientNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$ClientNotificationToJson(this);

  static bool _fromJson(String value) => value != '1';

  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'new', defaultValue: false, fromJson: _fromJson)
  final bool isRead;

  ClientNotification markRead() {
    return ClientNotification(
      id: id,
      title: title,
      message: message,
      createdAt: createdAt,
      isRead: true,
    );
  }
}
