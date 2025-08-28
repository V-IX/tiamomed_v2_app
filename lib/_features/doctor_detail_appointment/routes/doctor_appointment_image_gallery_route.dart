import 'package:go_router/go_router.dart';

import '../widgets/doctor_appointent_image_gallery/doctor_appointment_image_gallery_page.dart';

class DoctorAppointmentImageGalleryRoute {

  static const String name = 'doctor_appointment_image_gallery';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, GoRouterState state) {
      final int initialIndex = state.extra as int? ?? 0;
      return DoctorAppointmentImageGalleryPage(initialIndex: initialIndex);
    }
  );

}
