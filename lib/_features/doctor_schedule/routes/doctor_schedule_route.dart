import 'package:go_router/go_router.dart';

import '../widgets/doctor_schedule_page.dart';

class DoctorScheduleRoute {
  DoctorScheduleRoute._();

  static const String name = 'doctor_schedule';
  static const String path = '/$name';

  static final GoRoute route = GoRoute(
    name: name,
    path: path,
    builder: (_, _) => const DoctorSchedulePage(),
  );
}
