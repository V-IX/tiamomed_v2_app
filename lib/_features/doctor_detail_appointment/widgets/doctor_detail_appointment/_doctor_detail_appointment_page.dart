import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/doctor_active_appointment_route.dart';
import 'doctor_detail_appointment_content.dart';

class DoctorDetailAppointmentPage extends StatelessWidget {
  const DoctorDetailAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Прием')),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 200.0),
        child: FilledButton(
          onPressed: (){
            context.goNamed(DoctorActiveAppointmentRoute.name);
          },
          child: const Text('Начать')
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const DoctorDetailAppointmentContent(),
    );
  }
}
