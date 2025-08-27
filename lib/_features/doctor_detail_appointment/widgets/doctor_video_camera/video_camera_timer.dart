import 'package:flutter/material.dart';

import '../../../../utils/other/date_util.dart';

class VideoCameraTimer extends StatelessWidget {
  const VideoCameraTimer({super.key, required this.timeInSecond});

  final int timeInSecond;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
              width: 30,
              child:Icon(Icons.circle, color: Colors.red, size: 12)
          ),
          Stack(
            children: <Widget>[
              // Stroked text as border.
              Text(
                formattedTime(timeInSecond: timeInSecond),
                style: TextStyle(
                  fontSize: 16,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.black,
                ),
              ),
              // Solid text as fill.
              Text(
                formattedTime(timeInSecond: timeInSecond),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(width: 30)
        ],
      ),
    );
  }
}
