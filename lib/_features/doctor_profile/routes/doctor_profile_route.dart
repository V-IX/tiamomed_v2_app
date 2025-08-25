import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

import '../di/doctor_profile_di_wrapper.dart';
import '../widgets/profile/_doctor_profile_page.dart';
import 'doctor_profile_cabinets_route.dart';
import 'doctor_profile_datetime_intervals_route.dart';

class DoctorProfileRoute {
  static const String name = 'doctor_profile';
  static const String path = '/$name';
  static final ShellRoute route = ShellRoute(
    builder: (BuildContext context, GoRouterState state, Widget child) =>
        DoctorProfileDiWrapper(child: child),
    routes: <RouteBase>[
      GoRoute(
        name: name,
        path: path,
        builder: (_, _) => const DoctorProfilePage(),
        routes: <RouteBase>[
          DoctorProfileDateTimeIntervalsRoute.route,
          // DoctorProfileServicesRoute.route,
          DoctorProfileCabinetsRoute.route,
        ],
      ),
    ],
  );
}
