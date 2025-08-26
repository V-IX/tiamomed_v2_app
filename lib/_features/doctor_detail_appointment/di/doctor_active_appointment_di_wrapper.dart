import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:provider/provider.dart' as provider;
import 'package:provider/single_child_widget.dart';

import '../data/voice_record_service.dart';
import '../state/doctor_voice_recording/doctor_voice_recording_bloc.dart' as bloc;
import 'voice_record_service_provider.dart';

class DoctorActiveAppointmentDiWrapper extends StatelessWidget {
  const DoctorActiveAppointmentDiWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[voiceRecordServiceProvider],
      child: bloc.MultiBlocProvider(
        providers: <SingleChildWidget>[
          bloc.BlocProvider<bloc.DoctorVoiceRecordingBloc>(
            create: (BuildContext context) =>
                bloc.DoctorVoiceRecordingBloc(voiceRecordService: context.read<VoiceRecordService>()),
          ),
        ],
        child: child,
      ),
    );
  }
}
