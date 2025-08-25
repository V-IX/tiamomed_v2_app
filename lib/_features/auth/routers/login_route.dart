import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/auth_page.dart';

class LoginRoute {
  LoginRoute._();

  static const String name = 'login';
  static const String path = '/$name';
  static final GoRoute route = GoRoute(
    path: path,
    builder: (BuildContext context, GoRouterState state) => const AuthPage(),
  );

}
