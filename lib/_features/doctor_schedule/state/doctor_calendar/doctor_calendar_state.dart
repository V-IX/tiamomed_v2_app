part of 'doctor_calendar_cubit.dart';

@immutable
sealed class DoctorCalendarState {}

final class DoctorCalendarInitial extends DoctorCalendarState {}
final class DoctorCalendarLoading extends DoctorCalendarState {}
final class DoctorCalendarLoaded extends DoctorCalendarState {
  DoctorCalendarLoaded({required this.appointmentCounts});

  final List<AppointmentCount> appointmentCounts;
}
final class DoctorCalendarError extends DoctorCalendarState {
  DoctorCalendarError({required this.message});

  final String message;
}

