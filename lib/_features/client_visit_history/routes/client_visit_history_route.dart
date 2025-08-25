import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../client_home/routers/client_home_route.dart';
import '../widgets/client_visit_history_page.dart';
import 'client_visit_details_route.dart';

class ClientVisitHistoryRoute {
  ClientVisitHistoryRoute._();

  static const String name = 'client_visit_history';
  static const String path = '${ClientHomeRoute.path}/$name';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (BuildContext context, GoRouterState state) {
      return const ClientVisitHistoryPage();
    },
    routes: [
      ClientVisitDetailsRoute.route
    ]
  );
}
