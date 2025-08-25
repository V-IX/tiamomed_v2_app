import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../di/doctor_add_appointment_di_wrapper.dart';
import '../widgets/select_doctor/_select_doctor_for_add_appointment_page.dart';
import 'select_doctor_service_for_add_appointment_route.dart';

class SelectDoctorForAddAppointmentRoute {
  SelectDoctorForAddAppointmentRoute._();

  static const String name = 'select_doctor_for_add_appointment';
  static const String path = '/$name';

  static final ShellRoute route = ShellRoute(
    builder: (BuildContext context, GoRouterState state, Widget child) {
      return DoctorAddAppointmentDiWrapper(child: child);
    },
    routes: <RouteBase>[
      GoRoute(
        name: name,
        path: path,
        builder: (BuildContext context, GoRouterState state) {
          return const SelectDoctorForAddAppointmentPage();
        },
        routes: [
          SelectDoctorServiceForAddAppointmentRoute.route,
        ]
      ),
    ],
  );
}
