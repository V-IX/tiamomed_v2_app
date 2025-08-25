import 'package:flutter/material.dart';

import '../../../_shared/models/doctor/doctor_appointment.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key, required this.appointment, required this.onTap});

  final DoctorAppointment appointment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final bool isActive = appointment.status != DoctorAppointmentStatus.completed;

    return GestureDetector(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 72,
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 16),
                ],
                borderRadius: BorderRadius.circular(8),
                color: isActive ? const Color(0xFFFF0066) : const Color(0xffdedfe2),
              ),
              child: Center(
                child: Text(
                  appointment.startTime.isEmpty ? 'XX:XX' : appointment.startTime,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 16),
                  ],
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      appointment.clientName.isNotEmpty
                          ? appointment.clientName
                          : 'Нет данных клиента',
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Статус: ${appointment.status.text}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
