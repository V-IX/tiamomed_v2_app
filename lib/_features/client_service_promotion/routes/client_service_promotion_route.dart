import 'package:go_router/go_router.dart';

import '../widgets/_client_service_promotion_page.dart';

class ClientServicePromotionRoute {
  ClientServicePromotionRoute._();

  static const String name = 'client_service_promotion';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) {
      return const ClientServicePromotionPage();
    },
  );

}
