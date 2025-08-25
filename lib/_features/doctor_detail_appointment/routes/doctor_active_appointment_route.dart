import 'package:go_router/go_router.dart';

import '../widgets/doctor_active_appointment/doctor_active_appointment_page.dart';

class DoctorActiveAppointmentRoute {

  static const String name = 'doctor_active_appointment';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) {
      return const DoctorActiveAppointmentPage();
    },
  );

}
