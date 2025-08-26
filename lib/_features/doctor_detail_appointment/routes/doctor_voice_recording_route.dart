import 'package:go_router/go_router.dart';

import '../widgets/doctor_voice_recording/doctor_voice_recording_page.dart';

class DoctorVoiceRecordingRoute {
  DoctorVoiceRecordingRoute._();

  static const String name = 'doctor_voice_recording';
  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) => const DoctorVoiceRecordingPage(),
  );
}
