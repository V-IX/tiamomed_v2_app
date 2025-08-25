import 'package:go_router/go_router.dart';

import '../../client_home/routers/client_home_route.dart';
import '../widgets/client_files_page.dart';

class ClientFilesRoute {
  ClientFilesRoute._();

  static const String name = 'client_files';
  static const String path = '${ClientHomeRoute.path}/$name';

  static final GoRoute route = GoRoute(
    path: name,
    builder: (_, _) => const ClientFilesPage(),
  );
}
