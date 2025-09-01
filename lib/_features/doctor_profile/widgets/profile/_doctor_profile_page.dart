import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../../../_shared/models/doctor/doctor.dart';
import '../../routes/doctor_profile_cabinets_route.dart';
import '../../routes/doctor_profile_datetime_intervals_route.dart';
import 'doctor_category_card.dart';
import 'doctor_logout_button.dart';
import 'profile_doctor_card.dart';

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title:'Профиль'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              ProfileDoctorCard(doctor: Doctor.doctor),
              const SizedBox(height: 22),
              SizedBox(
                height: 100,
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    DoctorCategoryCard(
                      title: 'Расписание',
                      onTap: (){
                        context.pushNamed(DoctorProfileDateTimeIntervalsRoute.name);
                      }
                    ),
                    const SizedBox(width: 16),
                    DoctorCategoryCard(title: 'Услуги', onTap: (){}),
                    const SizedBox(width: 16),
                    DoctorCategoryCard(
                      title: 'Кабинеты',
                      onTap: (){
                        context.pushNamed(DoctorProfileCabinetsRoute.name);
                      }
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32.0),
              const Row(
                children: <Widget>[
                  Text(
                    'Настройки аккаунта',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 22.0),
              const ProfileLogoutButton(),
            ],
          ),
        )
      )
    );
  }
}
