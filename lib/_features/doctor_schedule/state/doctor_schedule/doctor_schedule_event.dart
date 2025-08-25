part of 'doctor_schedule_bloc.dart';

@immutable
sealed class DoctorScheduleEvent {}

final class LoadDoctorScheduleEvent extends DoctorScheduleEvent {
  LoadDoctorScheduleEvent({required this.date});

  final String date;
}
