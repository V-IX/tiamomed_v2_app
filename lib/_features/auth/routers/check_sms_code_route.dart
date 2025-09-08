import 'package:go_router/go_router.dart';

import '../widgets/check_sms_code_page.dart';
import 'login_route.dart';

class  CheckSmsCodeRoute {
  CheckSmsCodeRoute._();

  static const String name = 'check_sms_code';
  static const String path = '${LoginRoute.path}/$name';

  static final GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (_, _) {
      return const CheckSmsCodePage();
    },
  );

}
