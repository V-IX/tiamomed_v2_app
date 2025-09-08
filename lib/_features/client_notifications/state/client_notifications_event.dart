part of 'client_notifications_bloc.dart';

@immutable
sealed class ClientNotificationsEvent {}

class GetNotificationsEvent extends ClientNotificationsEvent {}

class MarkNotificationAsReadEvent extends ClientNotificationsEvent {
  MarkNotificationAsReadEvent({required this.id});

  final String id;
}
