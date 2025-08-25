import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../../_shared/data/doctor/doctor_appointments/doctor_appointments_repository.dart';
import '../../../../_shared/models/doctor/appointment_count.dart';

part 'doctor_calendar_state.dart';

class DoctorCalendarCubit extends Cubit<DoctorCalendarState> {
  DoctorCalendarCubit({required DoctorAppointmentsRepository appointmentsRepository})
    : _appointmentsRepository = appointmentsRepository,
      super(DoctorCalendarInitial());

  final DoctorAppointmentsRepository _appointmentsRepository;
  final Logger _logger = Logger();

  Future<void> loadAppointmentCounts() async {
    emit(DoctorCalendarLoading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      final List<AppointmentCount> appointmentCounts = await _appointmentsRepository
          .getAppointmentCounts(startDate: '20250801', endDate: '1231241');
      emit(DoctorCalendarLoaded(appointmentCounts: appointmentCounts));
    } catch (e) {
      _logger.e(e);
      emit(DoctorCalendarError(message: e.toString()));
    }
  }
}
