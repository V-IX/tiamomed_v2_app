import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/client_visit_details_page.dart';

class ClientVisitDetailsRoute {
  ClientVisitDetailsRoute._();

  static const String name = 'client_visit_details';

  static final GoRoute route = GoRoute(
    name: name,
    path: "$name/:client_visit_id'",
    builder: (BuildContext context, GoRouterState state) {
      final String id = state.pathParameters['client_visit_id']!;
      return ClientVisitDetailsPage(clientVisitId: id);
    },

  );
}
