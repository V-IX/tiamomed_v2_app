import 'package:flutter/material.dart';

class CameraGrid extends StatelessWidget {
  const CameraGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: List<Widget>.generate(3, (int row) {
          return Expanded(
            child: Row(
              children: List<Widget>.generate(3, (int col) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white.withOpacity(0.8), width: 0.7),
                    ),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }
}
