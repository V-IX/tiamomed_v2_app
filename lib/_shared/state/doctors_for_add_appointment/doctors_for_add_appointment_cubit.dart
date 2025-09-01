import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../data/doctor/doctor_info/doctor_repository.dart';
import '../../models/doctor/doctor.dart';

part 'doctors_for_add_appointment_state.dart';

class DoctorsForAddAppointmentCubit extends Cubit<DoctorsForAddAppointmentState> {
  DoctorsForAddAppointmentCubit({required DoctorRepository doctorRepository})
    : _doctorRepository = doctorRepository,
      super(DoctorsForAddAppointmentInitial());

  final DoctorRepository _doctorRepository;
  final Logger _logger = Logger();

  Future<void> loadDoctors(String? serviceId) async {
    emit(DoctorsForAddAppointmentLoading());
    try {
      final List<Doctor> doctors = await _doctorRepository.getDoctors();
      emit(DoctorsForAddAppointmentLoaded(doctors: doctors));
    } catch (e) {
      _logger.e(e);
      emit(DoctorsForAddAppointmentError(message: e.toString()));
    }
  }

}
