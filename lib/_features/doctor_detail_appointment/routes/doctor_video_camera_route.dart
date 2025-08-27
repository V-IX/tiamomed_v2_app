import 'package:go_router/go_router.dart';

import '../widgets/doctor_video_camera/_doctor_video_camera_page.dart';
import 'doctor_video_camera_result_route.dart';

class DoctorVideoCameraRoute {
  DoctorVideoCameraRoute._();

  static const String name = 'doctor_video_camera';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) => const DoctorVideoCameraPage(),
    routes: [
      DoctorVideoCameraResultRoute.route,
    ],
  );
}
