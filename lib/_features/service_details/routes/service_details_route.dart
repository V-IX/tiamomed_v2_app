import 'package:go_router/go_router.dart';

import '../../client_home/routers/client_home_route.dart';
import '../widgets/service_details_page.dart';

class ServiceDetailsRoute {
  static const String name = 'service_details';

  static final GoRoute route = GoRoute(
    name: name,
    path: '${ClientHomeRoute.path}/$name/:service_id',
    builder: (context, state) {
      final serviceId = state.pathParameters['service_id']!;
      return ServiceDetailsPage(serviceId: serviceId);
    },
  );

}
