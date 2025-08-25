part of 'doctor_profile_datetime_intervals_cubit.dart';

@immutable
sealed class DoctorProfileDatetimeIntervalsState {}

final class DoctorProfileDatetimeIntervalsInitial extends DoctorProfileDatetimeIntervalsState {}
final class DoctorProfileDatetimeIntervalsLoading extends DoctorProfileDatetimeIntervalsState {}
final class DoctorProfileDatetimeIntervalsLoaded extends DoctorProfileDatetimeIntervalsState {
  DoctorProfileDatetimeIntervalsLoaded({required this.intervals, required this.months});

  final Map<String, List<DateTimeInterval>> intervals;
  final List<String> months;
}
final class DoctorProfileDatetimeIntervalsError extends DoctorProfileDatetimeIntervalsState {
  DoctorProfileDatetimeIntervalsError({required this.message});

  final String message;
}
