import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  const DashLine({super.key, this.height = 1});

  final double height;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      final double boxWidth = constraints.constrainWidth();
      const double dashWidth = 3;
      const double dashHeight = 1.0;
      final int dashCount = (boxWidth / (2 * dashWidth)).floor();
      return SizedBox(
        height: height,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List<Widget>.generate(dashCount, (_) {
            return Container(
              width: dashWidth,
              height: dashHeight,
              child: const DecoratedBox(decoration: BoxDecoration(color: Color(0x69ABABAB))),
            );
          }),
        ),
      );
    });
  }
}
