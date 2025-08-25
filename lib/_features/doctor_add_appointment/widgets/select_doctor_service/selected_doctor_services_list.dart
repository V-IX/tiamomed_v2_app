import 'package:flutter/material.dart';

import '../../../../_shared/models/doctor/doctor_service.dart';
import 'selected_doctor_service_card.dart';

class SelectedDoctorServicesList extends StatelessWidget {
  const SelectedDoctorServicesList({super.key, required this.selectedServices});

  final List<DoctorService> selectedServices;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return SelectedDoctorServiceCard(
            doctorService: selectedServices[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16.0);
        },
        itemCount: selectedServices.length
    );
  }
}
