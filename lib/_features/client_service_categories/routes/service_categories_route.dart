import 'package:go_router/go_router.dart';

import '../../client_home/routers/client_home_route.dart';
import '../../client_service_details/routes/service_details_route.dart';
import '../widgets/service_categories_page.dart';

class ServiceCategoriesRoute {
  ServiceCategoriesRoute._();

  static const String name = 'service_categories';

  static final GoRoute route = GoRoute(
      name: name,
      path: '${ClientHomeRoute.path}/$name/:id',
      builder: (_, GoRouterState state) {
        final String categoryId = state.pathParameters['id']!;
        return ServiceCategoriesPage(categoryId: categoryId);
      },
      routes: <RouteBase>[
        ServiceDetailsRoute.route,
      ]
  );
}