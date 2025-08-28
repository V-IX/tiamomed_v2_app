import 'package:go_router/go_router.dart';

import '../widgets/_client_loyalty_program_page.dart';

class ClientLoyaltyProgramRoute {
  static const String name = 'client_loyalty_program';
  static const String path = '/$name';

  static final GoRoute route = GoRoute(
    path: path,
    name: name,
    builder: (_, _) => const ClientLoyaltyProgramPage(),
  );

}
