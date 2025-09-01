import 'package:go_router/go_router.dart';

import '../../client_add_appointment/routes/client_select_doctor_for_add_appointment_route.dart';
import '../../client_bonuses/routes/client_bonuses_route.dart';
import '../../client_feedback/routes/client_feedback_route.dart';
import '../../client_files/routes/client_files_route.dart';
import '../../client_service_categories/routes/service_categories_route.dart';
import '../../client_service_details/data/client_service_details_repository.dart';
import '../../client_service_details/routes/service_details_route.dart';
import '../../client_visit_history/routes/client_visit_history_route.dart';
import '../widgets/client_home_page.dart';

class ClientHomeRoute {
  ClientHomeRoute._();

  static const String name = 'client_home';
  static const String path = '/$name';
  static final GoRoute route = GoRoute(
    path: path,
    builder: (_, _) => const ClientHomePage(),
    routes: <RouteBase>[
      ServiceCategoriesRoute.route,
      ClientVisitHistoryRoute.route,
      ClientFilesRoute.route,
      ClientFeedbackRoute.route,
      ClientBonusesRoute.route,
      ClientServiceDetailsRoute.route,
    ]
  );
}
