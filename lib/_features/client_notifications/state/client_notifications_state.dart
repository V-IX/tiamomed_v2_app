part of 'client_notifications_bloc.dart';

enum ClientNotificationsStatus {
  initial,
  loading,
  loaded,
  error
}

class ClientNotificationsState {
  ClientNotificationsState({
    this.status = ClientNotificationsStatus.initial,
    this.message = '',
    this.notifications = const <ClientNotification>[],
  });

  final ClientNotificationsStatus status;
  final String message;
  final List<ClientNotification> notifications;

  ClientNotificationsState copyWith({
    ClientNotificationsStatus? status,
    String? message,
    List<ClientNotification>? notifications,
  }) {
    return ClientNotificationsState(
      status: status ?? this.status,
      message: message ?? this.message,
      notifications: notifications ?? this.notifications,
    );

  }

}
