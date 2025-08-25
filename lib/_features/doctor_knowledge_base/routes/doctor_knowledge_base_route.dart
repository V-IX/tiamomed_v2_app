import 'package:go_router/go_router.dart';

import '../widgets/doctor_knowledge_base_page.dart';

class DoctorKnowledgeBaseRoute {
  static const String name = 'doctor_knowledge_base';
  static const String path = '/$name';
  static final GoRoute route = GoRoute(
    name: name,
    path: path,
    builder: (_, _) => const DoctorKnowledgeBasePage(),
  );
}
