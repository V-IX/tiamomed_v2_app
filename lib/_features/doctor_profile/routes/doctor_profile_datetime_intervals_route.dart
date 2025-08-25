import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/profile_datetime_intervals/_doctor_profile_datetime_intervals_page.dart';

class DoctorProfileDateTimeIntervalsRoute {
  DoctorProfileDateTimeIntervalsRoute._();

  static const String name = 'doctor_profile_datetime_intervals';

  static final GoRoute route = GoRoute(
    path: name,
    name: name,
    builder: (_, _) {
      return const DoctorProfileDateTimeIntervalsPage();
    },
  );

}