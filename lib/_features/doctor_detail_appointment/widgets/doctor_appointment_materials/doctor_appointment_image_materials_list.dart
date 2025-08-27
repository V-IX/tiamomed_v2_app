import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/doctor_image_material.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';
import 'doctor_appointment_image_material_card.dart';

class DoctorAppointmentImageMaterialsList extends StatelessWidget {
  const DoctorAppointmentImageMaterialsList({super.key, required this.images});

  final List<DoctorImageMaterial> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Изображения'),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) {
            return DoctorAppointmentImageMaterialCard(
              imageMaterial: images[index],
              onCheckTap: () {
                context.read<DoctorAppointmentMaterialsBloc>().add(
                  ChangeImageMaterialSelectionEvent(index: index),
                );
              },
            );
          },
          separatorBuilder: (_, _) {
            return const SizedBox(height: 12);
          },
          itemCount: images.length,
        ),
      ],
    );
  }
}
