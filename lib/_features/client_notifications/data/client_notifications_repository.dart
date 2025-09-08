import '../models/client_notification.dart';
import 'client_notifications_api_service.dart';

class ClientNotificationsRepository {
  ClientNotificationsRepository({
    required ClientNotificationsApiService clientNotificationsApiService,
  }) : _clientNotificationsApiService = clientNotificationsApiService;

  final ClientNotificationsApiService _clientNotificationsApiService;

  Future<List<ClientNotification>> getNotifications() {
    return _clientNotificationsApiService.getNotifications();
  }

  Future<void> markNotificationAsRead(String id) {
    return _clientNotificationsApiService.markNotificationAsRead(id);
  }
}
