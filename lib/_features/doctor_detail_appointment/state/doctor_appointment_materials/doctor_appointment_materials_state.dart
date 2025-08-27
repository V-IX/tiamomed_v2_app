part of 'doctor_appointment_materials_bloc.dart';

class DoctorAppointmentMaterialsState {
  DoctorAppointmentMaterialsState({
    this.images = const <DoctorImageMaterial>[],
    this.videos = const <DoctorVideoMaterial>[],
    this.audios = const <DoctorAudioMaterial>[],
    this.isRecording = false,
    this.recordingSeconds = 0,
  });

  final List<DoctorImageMaterial> images;
  final List<DoctorVideoMaterial> videos;
  final List<DoctorAudioMaterial> audios;
  final bool isRecording;
  final int recordingSeconds;

  DoctorAppointmentMaterialsState copyWith({
    List<DoctorImageMaterial>? images,
    List<DoctorVideoMaterial>? videos,
    List<DoctorAudioMaterial>? audios,
    bool? isRecording,
    int? recordingSeconds,
  }) {
    return DoctorAppointmentMaterialsState(
      images: images ?? this.images,
      videos: videos ?? this.videos,
      audios: audios ?? this.audios,
      isRecording: isRecording ?? this.isRecording,
      recordingSeconds: recordingSeconds ?? this.recordingSeconds,
    );
  }
}
