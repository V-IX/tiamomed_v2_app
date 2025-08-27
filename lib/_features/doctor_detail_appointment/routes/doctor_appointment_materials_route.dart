import 'package:go_router/go_router.dart';

import '../widgets/doctor_appointment_materials/_doctor_appointment_materials_page.dart';

class DoctorAppointmentMaterialsRoute {
  DoctorAppointmentMaterialsRoute._();

  static const String name = 'doctor_appointment_materials';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) => const DoctorAppointmentMaterialsPage(),
  );
}
