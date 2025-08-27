import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../models/doctor_image_material.dart';
import '../../routes/doctor_appointment_materials_route.dart';
import '../../routes/doctor_photo_camera_route.dart';
import '../../routes/doctor_video_camera_route.dart';
import '../../routes/doctor_voice_recording_route.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';
import '../doctor_video_camera/_doctor_video_camera_page.dart';
import 'select_image_resource_bottom_sheet.dart';

final ButtonStyle _buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white),
  shadowColor: MaterialStateProperty.all(Colors.black),
  textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black)),
  overlayColor: MaterialStateProperty.all(Colors.black12),
  foregroundColor: MaterialStateProperty.all(Colors.black),
  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12, horizontal: 44)),
);

class DoctorActiveAppointmentPage extends StatelessWidget {
  const DoctorActiveAppointmentPage({super.key});

  Future<String?> _selectImageFromGallery() async {
    final ImagePicker picker = ImagePicker();

    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    return image?.path;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Прием'),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 22.0, right: 22, bottom: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: <Widget>[
            SizedBox(
              width: 260,
              child: FilledButton(
                style: _buttonStyle,
                onPressed: () {
                  showModalBottomSheet<void>(
                    useRootNavigator: true,
                    context: context,
                    builder: (_) {
                      return SelectImageResourceBottomSheet(
                        addFromCameraCallback: () {
                          context.goNamed(DoctorPhotoCameraRoute.name);
                        },
                        addFromGalleryCallback: () async {
                          final String? path = await _selectImageFromGallery();
                          if (path != null && context.mounted) {
                            context.read<DoctorAppointmentMaterialsBloc>().add(
                              AddImageMaterialEvent(
                                imageMaterial: DoctorImageMaterial(imagePath: path),
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                },
                child: const Text('Сделать фотографию'),
              ),
            ),
            SizedBox(
              width: 260,
              child: FilledButton(
                style: _buttonStyle,
                onPressed: () {
                  context.goNamed(DoctorVideoCameraRoute.name);
                },
                child: const Text('Сделать видео'),
              ),
            ),
            bloc.BlocBuilder<DoctorAppointmentMaterialsBloc, DoctorAppointmentMaterialsState>(
              builder: (BuildContext context, DoctorAppointmentMaterialsState state) {
                return SizedBox(
                  width: 260,
                  child: FilledButton(
                    style: _buttonStyle,
                    onPressed: () {
                      context.goNamed(DoctorVoiceRecordingRoute.name);
                    },
                    child: Text('Аудиозапись ${state.isRecording ? "идет" : ''}'),
                  ),
                );
              },
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: 260,
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(color: Theme.of(context).colorScheme.primary),
                  ),
                  textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.black)),
                ),
                onPressed: () {
                  context.goNamed(DoctorAppointmentMaterialsRoute.name);
                },
                child: const Text('Завершить прием'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
