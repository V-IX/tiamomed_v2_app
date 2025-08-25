import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;

import '../../../utils/other/void_callback_util.dart';
import '../state/doctor_calendar/doctor_calendar_cubit.dart';
import 'doctor_schedule_calendar.dart';

class DoctorScheduleCalendarWrapper extends StatelessWidget {
  const DoctorScheduleCalendarWrapper({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
  });

  final DateTime selectedDay;
  final VoidCallbackWithDate onDaySelected;

  @override
  Widget build(BuildContext context) {
    return bloc.BlocProvider<DoctorCalendarCubit>(
      create: (BuildContext context) =>
          DoctorCalendarCubit(appointmentsRepository: context.read())..loadAppointmentCounts(),
      child: bloc.BlocBuilder<DoctorCalendarCubit, DoctorCalendarState>(
        builder: (BuildContext context, DoctorCalendarState state) {
          return switch (state) {
            DoctorCalendarInitial() => const CircularProgressIndicator(),
            DoctorCalendarLoading() => const CircularProgressIndicator(),
            DoctorCalendarError() => DoctorScheduleCalendar(
              appointmentCounts: const [],
              selectedDay: selectedDay,
              onDaySelected: onDaySelected,
            ),
            DoctorCalendarLoaded() => DoctorScheduleCalendar(
              appointmentCounts: state.appointmentCounts,
              selectedDay: selectedDay,
              onDaySelected: onDaySelected,
            ),
          };
        },
      ),
    );
  }
}
