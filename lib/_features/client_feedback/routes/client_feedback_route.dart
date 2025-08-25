import 'package:go_router/go_router.dart';

import '../../client_home/routers/client_home_route.dart';
import '../widgets/client_feedback_page.dart';

class ClientFeedbackRoute {
  ClientFeedbackRoute._();

  static const String name = 'client_feedback';
  static const String path = '${ClientHomeRoute.path}/$name';

  static final GoRoute route = GoRoute(
    path: name,
    builder: (_, _) => const ClientFeedbackPage(),
  );

}
