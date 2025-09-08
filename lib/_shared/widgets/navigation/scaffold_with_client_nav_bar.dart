import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../_features/client_add_appointment/routes/client_select_doctor_for_add_appointment_route.dart';
import '../../../_features/client_home/routers/client_home_route.dart';
import '../../../_features/client_loyalty_program/routes/client_loyalty_program_route.dart';
import '../../../_features/client_notifications/routes/client_notifications_route.dart';
import '../../../_features/client_profile/routes/client_profile_route.dart';
import 'bottom_nav_item.dart';

class ScaffoldWithClientNavBar extends StatelessWidget {
  const ScaffoldWithClientNavBar({ required this.navigationShell, super.key });

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {

    final RouteMatch lastMatch = GoRouter.of(context).routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : GoRouter.of(context).routerDelegate.currentConfiguration;
    final String location = matchList.uri.toString();

    final bool isShowing =
      location == ClientHomeRoute.path ||
      location == ClientNotificationsRoute.path ||
      location == ClientLoyaltyProgramRoute.path ||
      location == ClientProfileRoute.path;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: navigationShell,
      floatingActionButton: isShowing ? SizedBox(
        height: 64,
        width: 64,
        child: FloatingActionButton(
          onPressed: (){
            context.pushNamed(ClientSelectDoctorForAddAppointmentRoute.name);
          },
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: const Color(0xFFFF0066),
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ) : null,
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: isShowing ? BottomAppBar(
        notchMargin: 8.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 70,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: BottomNavItem(
                isSelected: 0 == navigationShell.currentIndex,
                onCLick: (){
                  _goBranch(0);
                },
                iconPath: 'assets/images/hospital_icon.svg',
                title: 'Главная',
                index: 0,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                isSelected: 1 == navigationShell.currentIndex,
                onCLick: (){
                  _goBranch(1);
                },
                iconPath: 'assets/images/schedule_icon.svg',
                title: 'Уведомления',
                index: 1,
              ),
            ),
            SizedBox(width: 44),
            Expanded(
              child: BottomNavItem(
                isSelected: 2 == navigationShell.currentIndex,
                onCLick: (){
                  _goBranch(2);
                },
                iconPath: 'assets/images/layer_icon.svg',
                title: 'Карты',
                index: 2,
              ),
            ),
            Expanded(
              child: BottomNavItem(
                isSelected: 3 == navigationShell.currentIndex,
                onCLick: (){
                  _goBranch(3);
                },
                iconPath: 'assets/images/profile_icon.svg',
                title: 'Профиль',
                index: 3,
              ),
            ),
          ],
        ),
      ) : null,
    );
  }

}
