import 'package:go_router/go_router.dart';

import '../widgets/_client_profile_page.dart';
import 'client_personal_data_route.dart';

class ClientProfileRoute {
  ClientProfileRoute._();

  static const String name = 'client_profile';
  static const String path = '/$name';

  static final GoRoute route = GoRoute(
    path: path,
    name: name,
    builder: (_, _) {
      return const ClientProfilePage();
    },
    routes: <RouteBase>[
      ClientPersonalDataRoute.route,
    ]
  );
}
