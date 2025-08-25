import 'package:go_router/go_router.dart';

import '../widgets/client_notifications_page.dart';

class ClientNotificationsRoute {
  ClientNotificationsRoute._();

  static const String name = 'client_notifications';
  static const String path = '/$name';
  static final GoRoute route = GoRoute(
    path: path,
    name: name,
    builder: (_, _) {
      return const ClientNotificationsPage();
    },
  );

}
