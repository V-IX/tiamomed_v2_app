part of 'doctor_home_bloc.dart';

@immutable
sealed class DoctorHomeState {}

final class DoctorHomeInitial extends DoctorHomeState {}
final class DoctorHomeLoading extends DoctorHomeState {}
final class DoctorHomeLoaded extends DoctorHomeState {
  DoctorHomeLoaded({required this.todayAppointments, required this.doctor});

  final List<DoctorAppointment> todayAppointments;
  final Doctor doctor;
}
final class DoctorHomeError extends DoctorHomeState {
  DoctorHomeError({required this.message});

  final String message;
}

