import 'package:flutter/material.dart';

class CameraFocusCircle extends StatelessWidget {
  const CameraFocusCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
    );
  }
}
