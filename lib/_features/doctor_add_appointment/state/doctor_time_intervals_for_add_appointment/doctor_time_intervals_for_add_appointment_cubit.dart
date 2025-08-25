import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../../_shared/models/doctor/datetime_interval.dart';
import '../../../../_shared/models/doctor/doctor_service.dart';
import '../../../doctor_profile/data/doctor_repository.dart';

part 'doctor_time_intervals_for_add_appointment_state.dart';

class DoctorTimeIntervalsForAddAppointmentCubit
    extends Cubit<DoctorTimeIntervalsForAddAppointmentState> {
  DoctorTimeIntervalsForAddAppointmentCubit({required DoctorRepository doctorRepository})
    : _doctorRepository = doctorRepository,
      super(DoctorTimeIntervalsForAddAppointmentInitial());

  final DoctorRepository _doctorRepository;
  final Logger _logger = Logger();

  Future<void> fetchTimeIntervals({required String doctorId, required List<DoctorService> selectedServices}) async {
    emit(DoctorTimeIntervalsForAddAppointmentLoading());
    try {
      final List<DateTimeInterval> timeIntervals = await _doctorRepository.getDoctorBusyIntervalList(doctorId: doctorId, selectedServices: selectedServices);
      emit(DoctorTimeIntervalsForAddAppointmentSuccess(timeIntervals: timeIntervals));
    } catch (e) {
      _logger.e(e);
      emit(DoctorTimeIntervalsForAddAppointmentError(error: e.toString()));
    }
  }
}
