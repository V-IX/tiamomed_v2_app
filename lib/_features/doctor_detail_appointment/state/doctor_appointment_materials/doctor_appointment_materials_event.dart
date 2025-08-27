part of 'doctor_appointment_materials_bloc.dart';

sealed class DoctorAppointmentMaterialsEvent {}

class AddImageMaterialEvent extends DoctorAppointmentMaterialsEvent {
  AddImageMaterialEvent({required this.imageMaterial});

  final DoctorImageMaterial imageMaterial;

}

class AddVideoMaterialEvent extends DoctorAppointmentMaterialsEvent {
  AddVideoMaterialEvent({required this.videoMaterial});

  final DoctorVideoMaterial videoMaterial;
}

class AddAudioMaterialEvent extends DoctorAppointmentMaterialsEvent {
  AddAudioMaterialEvent({required this.audioMaterial});

  final DoctorAudioMaterial audioMaterial;
}

class ChangeImageMaterialSelectionEvent extends DoctorAppointmentMaterialsEvent {
  ChangeImageMaterialSelectionEvent({required this.index});

  final int index;
}

class ChangeVideoMaterialSelectionEvent extends DoctorAppointmentMaterialsEvent {
  ChangeVideoMaterialSelectionEvent({required this.index});

  final int index;
}

class ChangeAudioMaterialSelectionEvent extends DoctorAppointmentMaterialsEvent {
  ChangeAudioMaterialSelectionEvent({required this.index});

  final int index;
}

class StartDoctorVoiceRecordingEvent extends DoctorAppointmentMaterialsEvent {}

class StopDoctorVoiceRecordingEvent extends DoctorAppointmentMaterialsEvent {}

class _UpdateRecordingSecondsEvent extends DoctorAppointmentMaterialsEvent {
  _UpdateRecordingSecondsEvent({required this.seconds});

  final int seconds;

}
