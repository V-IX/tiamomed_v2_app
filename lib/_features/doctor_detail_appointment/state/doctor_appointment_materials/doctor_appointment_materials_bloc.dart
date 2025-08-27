import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../data/voice_record_service.dart';
import '../../models/doctor_audio_material.dart';
import '../../models/doctor_image_material.dart';
import '../../models/doctor_video_material.dart';

part 'doctor_appointment_materials_event.dart';
part 'doctor_appointment_materials_state.dart';

class DoctorAppointmentMaterialsBloc
    extends Bloc<DoctorAppointmentMaterialsEvent, DoctorAppointmentMaterialsState> {
  DoctorAppointmentMaterialsBloc({required VoiceRecordService voiceRecordService})
    : _voiceRecordService = voiceRecordService,
      super(DoctorAppointmentMaterialsState()) {
    on<AddAudioMaterialEvent>(_addAudioMaterial);
    on<AddImageMaterialEvent>(_addImageMaterial);
    on<AddVideoMaterialEvent>(_addVideoMaterial);
    on<StartDoctorVoiceRecordingEvent>(_startRecording);
    on<StopDoctorVoiceRecordingEvent>(_stopRecording);
    on<_UpdateRecordingSecondsEvent>(_updateRecordingSeconds);
    on<ChangeImageMaterialSelectionEvent>(_changeImageSelection);
  }

  Timer? _timer;
  final VoiceRecordService _voiceRecordService;

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  Future<void> _startRecording(StartDoctorVoiceRecordingEvent event, Emitter<DoctorAppointmentMaterialsState> emit) async {
    try {
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        add(_UpdateRecordingSecondsEvent(seconds: state.recordingSeconds + 1));
      });
      await _voiceRecordService.startRecording();
      emit(state.copyWith(isRecording: true));
    } catch(error) {
      emit(state.copyWith(isRecording: false));
    }
  }

  Future<void> _stopRecording(StopDoctorVoiceRecordingEvent event, Emitter<DoctorAppointmentMaterialsState> emit) async {
    try {
      final String? path = await _voiceRecordService.stopRecording();
      if(path != null) {
        final DoctorAudioMaterial audioMaterial = DoctorAudioMaterial(audioPath: path);
        add(AddAudioMaterialEvent(audioMaterial: audioMaterial));
      }
      _timer?.cancel();
      emit(state.copyWith(isRecording: false, recordingSeconds: 0));
    } catch(error) {
      emit(state.copyWith(isRecording: true));
    }
  }

  void _addAudioMaterial(
    AddAudioMaterialEvent event,
    Emitter<DoctorAppointmentMaterialsState> emit,
  ) {
    final List<DoctorAudioMaterial> audioMaterials = state.audios;
    emit(state.copyWith(audios: <DoctorAudioMaterial>[...audioMaterials, event.audioMaterial]));
  }

  void _addVideoMaterial(
    AddVideoMaterialEvent event,
    Emitter<DoctorAppointmentMaterialsState> emit,
  ) {
    final List<DoctorVideoMaterial> videoMaterials = state.videos;
    emit(state.copyWith(videos: <DoctorVideoMaterial>[...videoMaterials, event.videoMaterial]));
  }

  void _addImageMaterial(
    AddImageMaterialEvent event,
    Emitter<DoctorAppointmentMaterialsState> emit,
  ) {
    final List<DoctorImageMaterial> imageMaterials = state.images;
    emit(state.copyWith(images: <DoctorImageMaterial>[...imageMaterials, event.imageMaterial]));
  }

  void _updateRecordingSeconds(_UpdateRecordingSecondsEvent event, Emitter<DoctorAppointmentMaterialsState> emit) {
    emit(state.copyWith(recordingSeconds: event.seconds));
  }

  void _changeImageSelection(ChangeImageMaterialSelectionEvent event, Emitter<DoctorAppointmentMaterialsState> emit) {
    final List<DoctorImageMaterial> imageMaterials = state.images;
    final DoctorImageMaterial updatedImageMaterial = imageMaterials[event.index].changeSelection();
    final List<DoctorImageMaterial> updatedImageMaterials = <DoctorImageMaterial>[
      ...imageMaterials.sublist(0, event.index),
      updatedImageMaterial,
      ...imageMaterials.sublist(event.index + 1),
    ];
    emit(state.copyWith(images: updatedImageMaterials));
  }

}
