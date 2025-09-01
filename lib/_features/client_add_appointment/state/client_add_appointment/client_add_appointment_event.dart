part of 'client_add_appointment_bloc.dart';

@immutable
sealed class ClientAddAppointmentEvent {}

class ClientAddAppointmentSelectDoctorEvent extends ClientAddAppointmentEvent {
  ClientAddAppointmentSelectDoctorEvent({required this.doctor});

  final Doctor doctor;
}

class ClientAddAppointmentSelectServiceEvent extends ClientAddAppointmentEvent {
  ClientAddAppointmentSelectServiceEvent({required this.service});

  final DoctorService service;
}
