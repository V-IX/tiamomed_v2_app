import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';

import '../widgets/doctor_video_camera/_doctor_video_camera_result_page.dart';

class DoctorVideoCameraResultRoute {
  DoctorVideoCameraResultRoute._();

  static const String name = 'doctor_video_camera_result';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, GoRouterState state) {
      final XFile file = state.extra! as XFile;
      return DoctorVideoCameraResultPage(file: file);
    },
  );
}
