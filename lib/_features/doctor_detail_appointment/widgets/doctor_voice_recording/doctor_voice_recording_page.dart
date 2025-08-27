import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../../../utils/other/date_util.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';

class DoctorVoiceRecordingPage extends StatelessWidget {
  const DoctorVoiceRecordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Аудиозапись'),
      body: Padding(
        padding: const EdgeInsets.all(44.0),
        child: BlocBuilder<DoctorAppointmentMaterialsBloc, DoctorAppointmentMaterialsState>(
          builder: (BuildContext context, DoctorAppointmentMaterialsState state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.mic),

                  Text(formattedTime(timeInSecond: state.recordingSeconds)),

                  const SizedBox(height: 6.0),
                  Text(
                    state.isRecording ? 'Запись идет' : 'Начните запись',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 30.0),
                  const Text(
                    'Для начала записи нажмите кнопку «Начать аудиозапись»',
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 46.0),

                  SizedBox(
                    width: 220,
                    child: FilledButton(
                      onPressed: () async {
                        if (state.isRecording) {
                          context.read<DoctorAppointmentMaterialsBloc>().add(
                            StopDoctorVoiceRecordingEvent(),
                          );
                        } else {
                          context.read<DoctorAppointmentMaterialsBloc>().add(
                            StartDoctorVoiceRecordingEvent(),
                          );
                        }
                      },
                      child: Text(state.isRecording ? 'Остановить запись' : 'Начать запись'),
                    ),
                  ),
                  SizedBox(
                    width: 220,
                    child: OutlinedButton(
                      style: ButtonStyle(
                        side: WidgetStatePropertyAll<BorderSide>(
                          BorderSide(color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                      onPressed: () async {
                        context.pop();
                      },
                      child: const Text('Вернуться назад'),
                    ),
                  ),
                  const SizedBox(height: 46.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
