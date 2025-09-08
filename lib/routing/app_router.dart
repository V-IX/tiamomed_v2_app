import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../_features/auth/models/auth_user.dart';
import '../_features/auth/routers/check_sms_code_route.dart';
import '../_features/auth/routers/login_route.dart';
import '../_features/auth/state/auth_bloc.dart';
import '../_features/client_home/routers/client_home_route.dart';
import '../_features/client_loyalty_program/routes/client_loyalty_program_route.dart';
import '../_features/client_notifications/routes/client_notifications_route.dart';
import '../_features/client_profile/routes/client_profile_route.dart';
import '../_features/doctor_add_appointment/routes/select_doctor_for_add_appointment_route.dart';
import '../_features/doctor_home/routes/doctor_home_route.dart';
import '../_features/doctor_knowledge_base/routes/doctor_knowledge_base_route.dart';
import '../_features/doctor_profile/routes/doctor_profile_route.dart';
import '../_features/doctor_schedule/routes/doctor_schedule_route.dart';
import '../_shared/widgets/navigation/scaffold_with_client_nav_bar.dart';
import '../_shared/widgets/navigation/scaffold_with_doctor_nav_bar.dart';
import '../di/client_di_wrapper.dart';
import 'auth_listener.dart';

class AppRouter {
  AppRouter({required this.authListener}) {
    config = GoRouter(
      initialLocation: LoginRoute.path,
      routes: <RouteBase>[
        LoginRoute.route,
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            return ClientDiWrapper(child: ScaffoldWithClientNavBar(navigationShell: navigationShell));
          },
          branches: [
            StatefulShellBranch(routes: <RouteBase>[ClientHomeRoute.route]),
            StatefulShellBranch(routes: <RouteBase>[ClientNotificationsRoute.route]),
            StatefulShellBranch(routes: <RouteBase>[ClientLoyaltyProgramRoute.route]),
            StatefulShellBranch(routes: <RouteBase>[ClientProfileRoute.route]),
          ],
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
            return ScaffoldWithDoctorNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: <RouteBase>[DoctorHomeRoute.route]),
            StatefulShellBranch(routes: <RouteBase>[DoctorScheduleRoute.route]),
            StatefulShellBranch(routes: <RouteBase>[DoctorKnowledgeBaseRoute.route]),
            StatefulShellBranch(routes: <RouteBase>[DoctorProfileRoute.route]),
          ],
        ),
        SelectDoctorForAddAppointmentRoute.route,
      ],
      refreshListenable: authListener,
      redirect: (BuildContext context, GoRouterState state) {
        final AuthState authState = context.read<AuthBloc>().state;
        print(authState.status);
        if (authState.status.isAuthenticated &&
            state.matchedLocation == LoginRoute.path &&
            authState.user?.userType == UserType.doctor) {
          return DoctorHomeRoute.path;
        } else if (authState.status.isAuthenticated &&
            (state.matchedLocation == CheckSmsCodeRoute.path || state.matchedLocation == LoginRoute.path) &&
            (authState.user?.userType == UserType.client ||
                authState.user?.userType == UserType.sellerClient)) {
          return ClientHomeRoute.path;
        }
        if (authState.status.isUnauthenticated) {
          return LoginRoute.path;
        }
        return null;
      },
    );
  }

  final AuthListener authListener;
  late GoRouter config;
}
