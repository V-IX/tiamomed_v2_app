import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../di/client_add_appointment_di_wrapper.dart';
import '../widgets/client_select_doctor/client_select_doctor_for_add_appointment_page.dart';

class ClientSelectDoctorForAddAppointmentRoute {

  static const String name = 'client_select_doctor_for_add_appointment';

  static final route = ShellRoute(
    builder: (BuildContext context, GoRouterState state, Widget child) {
      return ClientAddAppointmentDiWrapper(child: child);
    },
      routes: [
      GoRoute(
        name: name,
        path: name,
        builder: (_, _) {
          return const ClientSelectDoctorForAddAppointmentPage();
        },
      )
    ]
  );

}
