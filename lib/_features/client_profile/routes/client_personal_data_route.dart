import 'package:go_router/go_router.dart';

import '../widgets/_client_personal_data_page.dart';

class ClientPersonalDataRoute {
  ClientPersonalDataRoute._();

  static const String name = 'client_personal_data';
  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) {
      return const ClientPersonalDataPage();
    },
  );
}
