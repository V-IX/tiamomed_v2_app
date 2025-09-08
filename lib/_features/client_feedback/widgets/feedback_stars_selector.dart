import 'package:flutter/material.dart';

import '../../../utils/other/void_callback_util.dart';

class FeedbackStarsSelector extends StatelessWidget {
  const FeedbackStarsSelector({super.key, required this.selectedStarCount, required this.starTap});

  final int selectedStarCount;
  final VoidCallbackWithInt starTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: <Widget>[
        for (int i = 1; i <= 5; i++)
          GestureDetector(
            child: Icon(
              Icons.star,
              size: 48,
              color: i > selectedStarCount
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
            ),
            onTap: () => starTap(i)
          ),
      ],
    );
  }
}
