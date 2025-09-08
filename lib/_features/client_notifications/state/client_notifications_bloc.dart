import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../data/client_notifications_repository.dart';
import '../models/client_notification.dart';

part 'client_notifications_event.dart';
part 'client_notifications_state.dart';

class ClientNotificationsBloc extends Bloc<ClientNotificationsEvent, ClientNotificationsState> {
  ClientNotificationsBloc({required ClientNotificationsRepository clientNotificationsRepository})
    : _clientNotificationsRepository = clientNotificationsRepository,
      super(ClientNotificationsState()) {
    on<GetNotificationsEvent>(_getNotifications);
    on<MarkNotificationAsReadEvent>(_markNotificationAsRead);

  }

  final ClientNotificationsRepository _clientNotificationsRepository;
  final Logger _logger = Logger();

  Future<void> _getNotifications(GetNotificationsEvent event, Emitter<ClientNotificationsState> emit) async {
    try {
      emit(state.copyWith(status: ClientNotificationsStatus.loading));
      final List<ClientNotification> notifications = await _clientNotificationsRepository.getNotifications();
      emit(state.copyWith(notifications: notifications, status: ClientNotificationsStatus.loaded));
    } catch (e) {
      _logger.e(e);
      emit(state.copyWith(notifications: [], status: ClientNotificationsStatus.error, message: e.toString()));
    }
  }

  Future<void> _markNotificationAsRead(MarkNotificationAsReadEvent event, Emitter<ClientNotificationsState> emit) async {
    try {
      final List<ClientNotification> notifications = state.notifications.map((notification) {
        if (notification.id == event.id) {
          return notification.markRead();
        }
        return notification;
      }).toList();
      emit(state.copyWith(notifications: notifications));
      await _clientNotificationsRepository.markNotificationAsRead(event.id);
    } catch (e) {
      _logger.e(e);
    }
  }
}
