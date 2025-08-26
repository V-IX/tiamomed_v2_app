import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '../../state/doctor_voice_recording/doctor_voice_recording_bloc.dart';

class DoctorVoiceRecordingPage extends StatelessWidget {
  const DoctorVoiceRecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Аудиозапись'),
      ),
      body: BlocBuilder<DoctorVoiceRecordingBloc, bool>(
        builder: (BuildContext context, bool isRecording) {
          return Column(
            children: [
              FilledButton(
                  onPressed: () async {
                    if(isRecording) {
                      context.read<DoctorVoiceRecordingBloc>().add(StopDoctorVoiceRecordingEvent());
                    } else {
                      final Directory directory = await getApplicationDocumentsDirectory();
                      final Directory folderPath = Directory('${directory.path}/material_of_record/');
                      if(folderPath.existsSync()){
                        context.read<DoctorVoiceRecordingBloc>().add(StartDoctorVoiceRecordingEvent(
                            path: '${folderPath.path}${DateTime.now}_audio.m4p'
                        ));
                      } else {
                        final Directory newFolderPath = await folderPath.create(recursive: true);
                        context.read<DoctorVoiceRecordingBloc>().add(StartDoctorVoiceRecordingEvent(
                            path: '${newFolderPath.path}${DateTime.now}_audio.m4p'
                        ));
                      }

                    }
                  },
                  child: Text(isRecording ? 'Остановить запись' : 'Начать запись')
              ),
            ],
          );
        },
      ),
    );
  }
}
