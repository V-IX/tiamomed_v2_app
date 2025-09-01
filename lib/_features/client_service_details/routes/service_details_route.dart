import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import '../../client_add_appointment/routes/client_select_doctor_for_add_appointment_route.dart';
import '../../client_home/routers/client_home_route.dart';
import '../widgets/_service_details_page.dart';

class ClientServiceDetailsRoute {
  static const String name = 'service_details';

  static final GoRoute route = GoRoute(
    name: name,
    path: '${ClientHomeRoute.path}/$name/:service_id',
    builder: (_, GoRouterState state) {
      final String serviceId = state.pathParameters['service_id']!;
      return ServiceDetailsPage(serviceId: serviceId);
    },
    routes: <RouteBase>[
      ClientSelectDoctorForAddAppointmentRoute.route,
    ]
  );

}
