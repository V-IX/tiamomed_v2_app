part of 'doctor_add_appointment_bloc.dart';

@immutable
sealed class DoctorAddAppointmentEvent {}

class DoctorAddAppointmentSelectDoctorEvent extends DoctorAddAppointmentEvent {
  DoctorAddAppointmentSelectDoctorEvent({required this.doctor});

  final Doctor doctor;
}

class DoctorAddAppointmentSelectServiceEvent extends DoctorAddAppointmentEvent {
  DoctorAddAppointmentSelectServiceEvent({required this.service});

  final DoctorService service;
}
