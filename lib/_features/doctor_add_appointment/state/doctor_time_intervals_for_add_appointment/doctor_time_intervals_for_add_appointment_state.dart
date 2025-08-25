part of 'doctor_time_intervals_for_add_appointment_cubit.dart';

@immutable
sealed class DoctorTimeIntervalsForAddAppointmentState {}

final class DoctorTimeIntervalsForAddAppointmentInitial extends DoctorTimeIntervalsForAddAppointmentState {}
final class DoctorTimeIntervalsForAddAppointmentLoading extends DoctorTimeIntervalsForAddAppointmentState {}
final class DoctorTimeIntervalsForAddAppointmentSuccess extends DoctorTimeIntervalsForAddAppointmentState {
  DoctorTimeIntervalsForAddAppointmentSuccess({required this.timeIntervals});

  final List<DateTimeInterval> timeIntervals;
}
final class DoctorTimeIntervalsForAddAppointmentError extends DoctorTimeIntervalsForAddAppointmentState {
  DoctorTimeIntervalsForAddAppointmentError({required this.error});

  final String error;
}
