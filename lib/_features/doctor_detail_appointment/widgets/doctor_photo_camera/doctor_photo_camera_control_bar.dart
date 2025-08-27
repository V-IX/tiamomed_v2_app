import 'package:flutter/material.dart';

class DoctorPhotoCameraControlBar extends StatelessWidget {
  const DoctorPhotoCameraControlBar({super.key, required this.onZoomTap, required this.onGridTap, required this.takePicture, required this.isShowingGrid});

  final VoidCallback onZoomTap;
  final VoidCallback onGridTap;
  final VoidCallback takePicture;
  final bool isShowingGrid;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 50,
          height: 50,
          child: IconButton(
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black45)),
            icon: const Icon(Icons.zoom_in, color: Colors.white, size: 24),
            onPressed: onZoomTap,
          ),
        ),
        const SizedBox(width: 50),
        SizedBox(
          width: 64,
          height: 64,
          child: FilledButton(

            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: Colors.red,
            ),
            onPressed: takePicture,
            child: const Icon(Icons.camera)
          ),
        ),
        const SizedBox(width: 50),
        SizedBox(
          width: 50,
          height: 50,
          child: IconButton(
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black45)),
            icon: Icon(
              isShowingGrid ? Icons.grid_on : Icons.grid_off,
              color: Colors.white,
              size: 24,
            ),
            onPressed: onGridTap,
          ),
        ),
      ],
    );
  }
}
