import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/voice_record_service.dart';

part 'doctor_voice_recording_event.dart';

class DoctorVoiceRecordingBloc extends Bloc<DoctorVoiceRecordingEvent, bool> {
  DoctorVoiceRecordingBloc({required VoiceRecordService voiceRecordService})
    : _voiceRecordService = voiceRecordService,
      super(false) {

    on<StartDoctorVoiceRecordingEvent>(_startRecording);
    on<StopDoctorVoiceRecordingEvent>(_stopRecording);
  }

  final VoiceRecordService _voiceRecordService;

  void _startRecording(StartDoctorVoiceRecordingEvent event, Emitter<bool> emit) {
    _voiceRecordService.startRecording(event.path);
    emit(true);
  }

  void _stopRecording(StopDoctorVoiceRecordingEvent event, Emitter<bool> emit) {
    _voiceRecordService.stopRecording();
    emit(false);
  }
}
