import 'package:go_router/go_router.dart';

import '../widgets/doctor_photo_camera/_doctor_photo_camera_page.dart';
import 'doctor_photo_camera_result_route.dart';


class DoctorPhotoCameraRoute {
  static const String name = 'doctor_photo_camera';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) => const DoctorPhotoCameraPage(),
    routes: <RouteBase>[
      DoctorPhotoCameraResultRoute.route,
    ],
  );

}
