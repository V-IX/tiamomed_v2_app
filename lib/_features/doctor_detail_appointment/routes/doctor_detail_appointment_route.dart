import 'package:go_router/go_router.dart';

import '../widgets/doctor_detail_appointment/_doctor_detail_appointment_page.dart';
import 'doctor_active_appointment_route.dart';

class DoctorDetailAppointmentRoute {
  DoctorDetailAppointmentRoute._();

  static const String name = 'doctor_detail_appointment';

  static final route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) {
      return const DoctorDetailAppointmentPage();
    },
    routes: <RouteBase>[
      DoctorActiveAppointmentRoute.route
    ]
  );

}
