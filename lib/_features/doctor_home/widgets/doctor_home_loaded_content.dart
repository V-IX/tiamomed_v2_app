import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../_shared/models/doctor/doctor_appointment.dart';
import '../../doctor_detail_appointment/routes/doctor_detail_appointment_route.dart';
import '../../../_shared/models/doctor/doctor.dart';
import 'appointment_card.dart';
import 'home_doctor_card.dart';

class DoctorHomeLoadedContent extends StatelessWidget {
  const DoctorHomeLoadedContent({super.key, required this.todayAppointments, required this.doctor});

  final List<DoctorAppointment> todayAppointments;
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        spacing: 22,
        children: [
          HomeDoctorCard(doctor: doctor),
          ListView.separated(
            shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return AppointmentCard(
                  appointment: todayAppointments[index],
                  onTap: () {
                    context.pushNamed(DoctorDetailAppointmentRoute.name);
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemCount: todayAppointments.length
          ),
          const SizedBox(height: 44)
        ],
      ),
    );
  }
}
