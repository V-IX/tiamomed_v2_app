import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../../_shared/data/doctor/doctor_appointments/doctor_appointments_repository.dart';
import '../../../../_shared/models/doctor/doctor_appointment.dart';

part 'doctor_schedule_event.dart';
part 'doctor_schedule_state.dart';

class DoctorScheduleBloc extends Bloc<DoctorScheduleEvent, DoctorScheduleState> {
  DoctorScheduleBloc({required DoctorAppointmentsRepository appointmentsRepository})
    : _appointmentsRepository = appointmentsRepository,
      super(DoctorScheduleInitial()) {
    on<LoadDoctorScheduleEvent>(_loadDoctorSchedule);
  }

  final DoctorAppointmentsRepository _appointmentsRepository;
  final Logger _logger = Logger();

  Future<void> _loadDoctorSchedule(LoadDoctorScheduleEvent event, Emitter<DoctorScheduleState> emit) async {
    emit(DoctorScheduleLoading());
    try {
      await Future.delayed(const Duration(seconds: 3));
      final List<DoctorAppointment> appointments = await _appointmentsRepository
          .getAppointmentsByDate(date: event.date);
      emit(DoctorScheduleLoaded(appointments: appointments));
    } catch(error) {
      _logger.e(error);
      emit(DoctorScheduleError(message: error.toString()));
    }
  }
}
