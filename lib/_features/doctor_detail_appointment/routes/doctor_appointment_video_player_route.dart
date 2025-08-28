import 'package:go_router/go_router.dart';

import '../widgets/doctor_appointment_video_player/doctor_appointment_video_player_page.dart';

class DoctorAppointmentVideoPlayerRoute {
  static const String name = 'doctor_appointment_video_player';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, GoRouterState state) {
      final String videoPath = state.extra! as String;
      return DoctorAppointmentVideoPlayerPage(videoPath: videoPath);
    },
  );

}
