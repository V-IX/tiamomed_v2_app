import 'package:go_router/go_router.dart';

import '../../doctor_add_appointment/widgets/select_doctor/_select_doctor_for_add_appointment_page.dart';

class ClientSelectDoctorForAddAppointmentRoute {

  static const String name = 'client_select_doctor_for_add_appointment';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) {
      return const SelectDoctorForAddAppointmentPage();
    },
  );

}
