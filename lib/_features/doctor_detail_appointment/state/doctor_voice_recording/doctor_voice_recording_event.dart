part of 'doctor_voice_recording_bloc.dart';

@immutable
sealed class DoctorVoiceRecordingEvent {}

class StartDoctorVoiceRecordingEvent extends DoctorVoiceRecordingEvent {
  StartDoctorVoiceRecordingEvent({required this.path});

  final String path;
}

class StopDoctorVoiceRecordingEvent extends DoctorVoiceRecordingEvent {}
