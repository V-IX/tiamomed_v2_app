import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../di/doctor_add_appointment_di_wrapper.dart';
import '../widgets/select_doctor/_select_doctor_for_add_appointment_page.dart';
import '../widgets/select_doctor_service/select_doctor_service_for_add_appointment_page.dart';
import 'select_doctor_time_interval_for_add_appointment_route.dart';

class SelectDoctorServiceForAddAppointmentRoute {
  SelectDoctorServiceForAddAppointmentRoute._();

  static const String name = 'select_doctor_service_for_add_appointment';

  static final GoRoute route = GoRoute(
    path: name,
    name: name,
    builder: (BuildContext context, GoRouterState state) {
      return const SelectDoctorServiceForAddAppointmentPage();
    },
    routes: [
      SelectDoctorTimeIntervalForAddAppointmentRoute.route
    ]
  );
}
