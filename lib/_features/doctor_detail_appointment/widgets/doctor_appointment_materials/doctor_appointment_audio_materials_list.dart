import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/doctor_audio_material.dart';
import '../../models/doctor_image_material.dart';
import '../../routes/doctor_appointment_audio_player_route.dart';
import '../../routes/doctor_appointment_image_gallery_route.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';
import 'doctor_appointment_audio_material_card.dart';
import 'doctor_appointment_image_material_card.dart';

class DoctorAppointmentAudioMaterialsList extends StatelessWidget {
  const DoctorAppointmentAudioMaterialsList({super.key, required this.audios});

  final List<DoctorAudioMaterial> audios;


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
            return DoctorAppointmentAudioMaterialCard(
              audioMaterial: audios[index],
              onTap: () {
                context.pushNamed(DoctorAppointmentAudioPlayerRoute.name, extra: index);
              },
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
          itemCount: audios.length,
        ),
      ],
    );
  }
}
