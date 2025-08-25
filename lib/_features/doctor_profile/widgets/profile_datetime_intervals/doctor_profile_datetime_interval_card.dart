import 'package:flutter/material.dart';

import '../../../../_shared/widgets/dash_line.dart';


class DoctorProfileDatetimeIntervalCard extends StatelessWidget {
  const DoctorProfileDatetimeIntervalCard({
    super.key,
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  final String date;
  final String startTime;
  final String endTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Дата:',
                    style: TextStyle(
                      color: Color(0xFF7C8085),
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xFF282F41),
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              )
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Начала работы:',
                    style: TextStyle(
                      color: Color(0xFF7C8085),
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    startTime,
                    style: const TextStyle(
                      color: Color(0xFF282F41),
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              )
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Конец работы:',
                    style: TextStyle(
                      color: Color(0xFF7C8085),
                      fontSize: 10,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    endTime,
                    style: const TextStyle(
                      color: Color(0xFF282F41),
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              )
            )
          ],
        ),
        const SizedBox(height: 8.0),
        const DashLine()
      ],
    );
  }
}
