import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:go_router/go_router.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as provider;

import '../../data/voice_record_service.dart';
import '../../di/voice_record_service_provider.dart';
import '../../routes/doctor_voice_recording_route.dart';
import '../../state/doctor_voice_recording/doctor_voice_recording_bloc.dart' as bloc;
import '../../state/doctor_voice_recording/doctor_voice_recording_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Прием')),
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
                      return const SelectImageResourceBottomSheet();
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
                onPressed: () {},
                child: const Text('Сделать видео'),
              ),
            ),
            bloc.BlocBuilder<bloc.DoctorVoiceRecordingBloc, bool>(
      builder: (context, isRecording) {
        return SizedBox(
              width: 260,
              child: FilledButton(
                style: _buttonStyle,
                onPressed: () {
                  context.pushNamed(DoctorVoiceRecordingRoute.name);
                },
                child: Text('Аудиозапись ${isRecording ? "идет" : ''}'),
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
                onPressed: () {},
                child: const Text('Завершить прием'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
