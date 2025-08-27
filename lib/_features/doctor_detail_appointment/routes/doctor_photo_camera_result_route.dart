import 'package:camera/camera.dart';
import 'package:go_router/go_router.dart';

import '../widgets/doctor_photo_camera/_doctor_photo_camera_result_page.dart';

class DoctorPhotoCameraResultRoute {
  DoctorPhotoCameraResultRoute._();

  static const String name = 'doctor_photo_camera_result';

  static final GoRoute route = GoRoute(
    path: name,
    name: name,
    builder: (_, GoRouterState state) {
      final XFile image = state.extra! as XFile;
      return DoctorPhotoCameraResultPage(image: image);
    },

  );

}
