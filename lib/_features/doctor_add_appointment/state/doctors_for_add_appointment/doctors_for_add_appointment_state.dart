part of 'doctors_for_add_appointment_cubit.dart';

@immutable
sealed class DoctorsForAddAppointmentState {}

final class DoctorsForAddAppointmentInitial extends DoctorsForAddAppointmentState {}
final class DoctorsForAddAppointmentLoading extends DoctorsForAddAppointmentState {}
final class DoctorsForAddAppointmentLoaded extends DoctorsForAddAppointmentState {
  DoctorsForAddAppointmentLoaded({required this.doctors});

  final List<Doctor> doctors;
}
final class DoctorsForAddAppointmentError extends DoctorsForAddAppointmentState {
  DoctorsForAddAppointmentError({required this.message});

  final String message;
}
