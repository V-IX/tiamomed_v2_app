import 'package:go_router/go_router.dart';

import '../widgets/_client_bonuses_page.dart';

class ClientBonusesRoute {
  static const String name = 'client_bonuses';

  static final GoRoute route = GoRoute(
    path: name,
    name: name,
    builder: (_, _) => const ClientBonusesPage(),
  );
}