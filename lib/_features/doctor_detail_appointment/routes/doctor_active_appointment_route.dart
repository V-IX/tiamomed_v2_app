import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../di/doctor_active_appointment_di_wrapper.dart';
import '../widgets/doctor_active_appointment/doctor_active_appointment_page.dart';
import 'doctor_voice_recording_route.dart';

class DoctorActiveAppointmentRoute {
  static const String name = 'doctor_active_appointment';

  static final route = ShellRoute(
    builder: (BuildContext context, GoRouterState state, Widget child) {
      return DoctorActiveAppointmentDiWrapper(child: child);
    },
    routes: [
      GoRoute(
        name: name,
        path: name,
        builder: (_, _) {
          return const DoctorActiveAppointmentPage();
        },
        routes: [DoctorVoiceRecordingRoute.route],
      ),
    ],
  );
}
