import 'package:go_router/go_router.dart';

import '../widgets/profile_cabinets/_doctor_profile_cabinets_page.dart';

class DoctorProfileCabinetsRoute {
  DoctorProfileCabinetsRoute._();

  static const String name = 'doctor_profile_cabinets';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) => const DoctorProfileCabinetsPage(),
  );

}
