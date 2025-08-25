import 'package:flutter/material.dart';

import '../../../../_shared/models/doctor/datetime_interval.dart';
import 'doctor_profile_datetime_interval_card.dart';
import 'select_month_widget.dart';

class DoctorProfileDatetimeIntervalsList extends StatefulWidget {
  const DoctorProfileDatetimeIntervalsList({
    super.key,
    required this.datetimeIntervals,
    required this.months,
  });

  final Map<String, List<DateTimeInterval>> datetimeIntervals;
  final List<String> months;

  @override
  State<DoctorProfileDatetimeIntervalsList> createState() =>
      _DoctorProfileDatetimeIntervalsListState();
}

class _DoctorProfileDatetimeIntervalsListState extends State<DoctorProfileDatetimeIntervalsList> {
  int selectedMonthIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> dateList = widget.datetimeIntervals.keys
        .where(
          (String element) =>
              element.contains(widget.months[selectedMonthIndex]) && widget.months.isNotEmpty,
        )
        .toList();

    return widget.datetimeIntervals.isEmpty
      ? const Center(child: Text('Расписание отсутствует'))
      : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 16.0),
            SelectMonthWidget(
              setMonthNumber: (int monthNumber) {
                setState(() {
                  selectedMonthIndex = monthNumber;
                });
              },
              monthNumber: selectedMonthIndex,
              months: widget.months,
            ),
            const SizedBox(height: 16.0),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                final List<DateTimeInterval>? item = widget.datetimeIntervals[dateList[index]];

                return DoctorProfileDatetimeIntervalCard(
                  date: dateList[index],
                  startTime: item?[0].timeInterval.timeN ?? 'XX:XX',
                  endTime: item?[item.length - 1].timeInterval.timeK ?? 'XX:XX',
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemCount: dateList.length,
            ),
          ],
        ),
      );
  }
}
