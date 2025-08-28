import 'package:go_router/go_router.dart';

import '../widgets/doctor_appointment_materials/_doctor_appointment_materials_page.dart';
import 'doctor_appointment_audio_player_route.dart';
import 'doctor_appointment_image_gallery_route.dart';
import 'doctor_appointment_video_player_route.dart';

class DoctorAppointmentMaterialsRoute {
  DoctorAppointmentMaterialsRoute._();

  static const String name = 'doctor_appointment_materials';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) => const DoctorAppointmentMaterialsPage(),
    routes: <RouteBase>[
      DoctorAppointmentImageGalleryRoute.route,
      DoctorAppointmentVideoPlayerRoute.route,
      DoctorAppointmentAudioPlayerRoute.route,
    ]
  );
}
