import 'package:go_router/go_router.dart';

import '../../doctor_detail_appointment/routes/doctor_detail_appointment_route.dart';
import '../widgets/doctor_home_page.dart';

class DoctorHomeRoute {
  DoctorHomeRoute._();

  static const String name = 'doctor_home';
  static const String path = '/$name';

  static final GoRoute route = GoRoute(
    name: name,
    path: path,
    builder: (_, _) => const DoctorHomePage(),
    routes: <RouteBase>[
      DoctorDetailAppointmentRoute.route
    ]
  );

}
