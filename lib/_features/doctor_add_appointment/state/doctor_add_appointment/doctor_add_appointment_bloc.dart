import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../_shared/models/doctor/doctor_service.dart';
import '../../../../_shared/models/doctor/doctor.dart';

part 'doctor_add_appointment_event.dart';
part 'doctor_add_appointment_state.dart';

class DoctorAddAppointmentBloc extends Bloc<DoctorAddAppointmentEvent, DoctorAddAppointmentState> {
  DoctorAddAppointmentBloc() : super(DoctorAddAppointmentState()) {
    on<DoctorAddAppointmentSelectDoctorEvent>(_selectDoctor);
    on<DoctorAddAppointmentSelectServiceEvent>(_selectService);
  }

  void _selectDoctor(DoctorAddAppointmentSelectDoctorEvent event, Emitter<DoctorAddAppointmentState> emit) {
    emit(DoctorAddAppointmentState(selectedDoctor: event.doctor));
  }

  void _selectService(DoctorAddAppointmentSelectServiceEvent event, Emitter<DoctorAddAppointmentState> emit) {
    emit(DoctorAddAppointmentState(selectedServices: state.selectedServices..add(event.service)));
  }

}
