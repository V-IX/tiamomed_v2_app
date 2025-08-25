import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../_shared/models/doctor/appointment_count.dart';
import '../../../utils/other/void_callback_util.dart';

class DoctorScheduleCalendar extends StatefulWidget {
  const DoctorScheduleCalendar({
    super.key,
    required this.appointmentCounts,
    required this.selectedDay,
    required this.onDaySelected,
  });

  final List<AppointmentCount> appointmentCounts;
  final DateTime selectedDay;
  final VoidCallbackWithDate onDaySelected;

  @override
  State<DoctorScheduleCalendar> createState() => _DoctorScheduleCalendarState();
}

class _DoctorScheduleCalendarState extends State<DoctorScheduleCalendar> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: "ru_RU",
      firstDay: DateTime.now().subtract(Duration(days: 10)),
      lastDay: DateTime.now().add(const Duration(days: 365)),
      focusedDay: _focusedDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
        titleTextFormatter: (DateTime date, dynamic locale) {
          return DateFormat.yMMMM(locale).format(date);
        },
        titleTextStyle: const TextStyle(fontSize: 14),
      ),
      calendarStyle: const CalendarStyle(
        todayDecoration: ShapeDecoration(shape: CircleBorder(), color: Colors.black26),
        selectedDecoration: ShapeDecoration(shape: CircleBorder(), color: Color(0xFFFF0066)),
      ),
      selectedDayPredicate: (DateTime day) {
        return isSameDay(widget.selectedDay, day);
      },
      calendarBuilders: CalendarBuilders<Object?>(
        markerBuilder: (BuildContext context, DateTime day, List<Object?> marker) {
          final Iterable<String> dateList = widget.appointmentCounts.map(
            (AppointmentCount e) => e.date,
          );
          if (dateList.contains(DateFormat("yyyy.MM.dd").format(day))) {
            final AppointmentCount text = widget.appointmentCounts.firstWhere(
              (AppointmentCount element) => element.date == DateFormat("yyyy.MM.dd").format(day),
            );

            return Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                      color: Color(0xFFFF0066),
                    ),
                    child: Center(
                      child: Text(
                        text.count.toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return null;
        },
      ),
      onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
        if (!isSameDay(widget.selectedDay, selectedDay)) {
          //context.read<CalendarBloc>().add(GetRecordsByDateEvent(date: "${DateFormat("yyyyMMdd").format(selectedDay)}000000"));
          widget.onDaySelected(selectedDay);
          setState(() {
            _focusedDay = focusedDay;
          });
        }
      },
      onPageChanged: (DateTime focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
