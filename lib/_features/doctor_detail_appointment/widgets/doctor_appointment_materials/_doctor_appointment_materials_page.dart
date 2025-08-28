import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';
import 'doctor_appointment_audio_materials_list.dart';
import 'doctor_appointment_image_materials_list.dart';
import 'doctor_appointment_video_materials_list.dart';

class DoctorAppointmentMaterialsPage extends StatelessWidget {
  const DoctorAppointmentMaterialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Материалы приема',
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: BlocBuilder<DoctorAppointmentMaterialsBloc, DoctorAppointmentMaterialsState>(
          builder: (BuildContext context, DoctorAppointmentMaterialsState state) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  if(state.images.isNotEmpty)
                    DoctorAppointmentImageMaterialsList(images: state.images),
                  if(state.videos.isNotEmpty)
                    DoctorAppointmentVideoMaterialsList(videos: state.videos),
                  if(state.audios.isNotEmpty)
                    DoctorAppointmentAudioMaterialsList(audios: state.audios),
                ]
              )
            );
          },
        ),
      ),
    );
  }
}
