import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../client_feedback/routes/client_feedback_route.dart';
import '../../client_files/routes/client_files_route.dart';
import '../../client_visit_history/routes/client_visit_history_route.dart';
import '../../service_categories/routes/service_categories_route.dart';
import '../widgets/client_home_page.dart';

class ClientHomeRoute {
  ClientHomeRoute._();

  static const String name = 'client_home';
  static const String path = '/$name';
  static final GoRoute route = GoRoute(
    path: path,
    builder: (BuildContext context, GoRouterState state) => const ClientHomePage(),
    routes: <RouteBase>[
      ServiceCategoriesRoute.route,
      ClientVisitHistoryRoute.route,
      ClientFilesRoute.route,
      ClientFeedbackRoute.route,
    ]
  );
}
