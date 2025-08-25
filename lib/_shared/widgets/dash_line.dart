import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  const DashLine({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final double boxWidth = constraints.constrainWidth();
      const double dashWidth = 3;
      const double dashHeight = 1.0;
      final int dashCount = (boxWidth / (2 * dashWidth)).floor();
      return Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: List<Widget>.generate(dashCount, (_) {
          return const SizedBox(
            width: dashWidth,
            height: dashHeight,
            child: DecoratedBox(decoration: BoxDecoration(color: Color(0x69ABABAB))),
          );
        }),
      );
    });
  }
}
