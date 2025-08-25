import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../_shared/data/doctor/doctor_appointments/doctor_appointments_repository.dart';
import '../../../_shared/models/doctor/doctor_appointment.dart';
import '../../doctor_profile/data/doctor_repository.dart';
import '../../doctor_profile/models/doctor.dart';

part 'doctor_home_event.dart';
part 'doctor_home_state.dart';

class DoctorHomeBloc extends Bloc<DoctorHomeEvent, DoctorHomeState> {
  DoctorHomeBloc({
    required DoctorAppointmentsRepository doctorAppointmentsRepository,
    required DoctorRepository doctorRepository,
  }) : _doctorAppointmentsRepository = doctorAppointmentsRepository,
       _doctorRepository = doctorRepository,
       super(DoctorHomeInitial()) {

    on<LoadDoctorHomeEvent>(_loadDoctorHome);
  }

  final DoctorAppointmentsRepository _doctorAppointmentsRepository;
  final DoctorRepository _doctorRepository;
  final Logger _logger = Logger();

  Future<void> _loadDoctorHome(LoadDoctorHomeEvent event, Emitter<DoctorHomeState> emit) async {
    try {
      emit(DoctorHomeLoading());
      final Doctor doctor = await _doctorRepository.getDoctorInfo();
      final List<DoctorAppointment> todayAppointments = await _doctorAppointmentsRepository.getAppointmentsByDate(date: DateTime.now().toString());
      emit(DoctorHomeLoaded(todayAppointments: todayAppointments, doctor: doctor));
    } catch (e) {
      emit(DoctorHomeError(message: e.toString()));
      _logger.e(e);
    }
  }

}
