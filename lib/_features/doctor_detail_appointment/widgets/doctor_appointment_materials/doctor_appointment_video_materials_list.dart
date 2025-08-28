import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/doctor_image_material.dart';
import '../../models/doctor_video_material.dart';
import '../../routes/doctor_appointment_image_gallery_route.dart';
import '../../routes/doctor_appointment_video_player_route.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';
import 'doctor_appointment_image_material_card.dart';
import 'doctor_appointment_video_material_card.dart';

class DoctorAppointmentVideoMaterialsList extends StatelessWidget {
  const DoctorAppointmentVideoMaterialsList({super.key, required this.videos});

  final List<DoctorVideoMaterial> videos;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text('Видеозаписи'),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, int index) {
            return DoctorAppointmentVideoMaterialCard(
              videoMaterial: videos[index],
              onTap: () {
                context.pushNamed(DoctorAppointmentVideoPlayerRoute.name, extra: videos[index].videoPath);
              },
              onCheckTap: () {
                context.read<DoctorAppointmentMaterialsBloc>().add(
                  ChangeVideoMaterialSelectionEvent(index: index),
                );
              },
            );
          },
          separatorBuilder: (_, _) {
            return const SizedBox(height: 12);
          },
          itemCount: videos.length,
        ),
      ],
    );
  }
}
