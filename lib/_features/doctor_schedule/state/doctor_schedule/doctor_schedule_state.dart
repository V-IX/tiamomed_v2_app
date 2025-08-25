part of 'doctor_schedule_bloc.dart';

@immutable
sealed class DoctorScheduleState {}

final class DoctorScheduleInitial extends DoctorScheduleState {}
final class DoctorScheduleLoading extends DoctorScheduleState {}
final class DoctorScheduleLoaded extends DoctorScheduleState {
  DoctorScheduleLoaded({required this.appointments});

  final List<DoctorAppointment> appointments;
}
final class DoctorScheduleError extends DoctorScheduleState {
  DoctorScheduleError({required this.message});

  final String message;
}

