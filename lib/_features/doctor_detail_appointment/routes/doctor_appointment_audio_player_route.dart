import 'package:go_router/go_router.dart';

import '../widgets/doctor_appointment_audio_player/doctor_appointment_audio_player_page.dart';

class DoctorAppointmentAudioPlayerRoute {
  static const String name = 'doctor_appointment_audio_player';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, GoRouterState state) {
      final int index = state.extra as int? ?? 0;
      return DoctorAppointmentAudioPlayerPage(index: index);
    }
  );

}
