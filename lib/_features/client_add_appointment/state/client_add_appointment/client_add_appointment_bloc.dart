import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../_shared/models/doctor/doctor.dart';
import '../../../../_shared/models/doctor/doctor_service.dart';

part 'client_add_appointment_event.dart';
part 'client_add_appointment_state.dart';

class ClientAddAppointmentBloc extends Bloc<ClientAddAppointmentEvent, ClientAddAppointmentState> {
  ClientAddAppointmentBloc() : super(ClientAddAppointmentState()) {
    on<ClientAddAppointmentSelectDoctorEvent>(_selectDoctor);
    on<ClientAddAppointmentSelectServiceEvent>(_selectService);
  }

  void _selectDoctor(
    ClientAddAppointmentSelectDoctorEvent event,
    Emitter<ClientAddAppointmentState> emit,
  ) {
    emit(state.copyWith(selectedDoctor: event.doctor));
  }

  void _selectService(
    ClientAddAppointmentSelectServiceEvent event,
    Emitter<ClientAddAppointmentState> emit,
  ) {
    emit(state.copyWith(selectedServices: state.selectedServices..add(event.service)));
  }
}
