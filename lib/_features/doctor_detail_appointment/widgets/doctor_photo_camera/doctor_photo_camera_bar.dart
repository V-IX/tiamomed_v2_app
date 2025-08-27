import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DoctorPhotoCameraBar extends StatefulWidget {
  const DoctorPhotoCameraBar({
    super.key,
    required this.cameraController,
    required this.isShowingZoomText,
    required this.currentZoomLevel,
  });

  final CameraController cameraController;
  final bool isShowingZoomText;
  final double currentZoomLevel;

  @override
  State<DoctorPhotoCameraBar> createState() => _DoctorPhotoCameraBarState();
}

class _DoctorPhotoCameraBarState extends State<DoctorPhotoCameraBar> {
  bool _flashIsSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RotatedBox(
          quarterTurns: 45,
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.close, color: Colors.white, size: 32),
          ),
        ),
        if (widget.isShowingZoomText)
          Text(
            '${widget.currentZoomLevel}X',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
          )
        else
          const SizedBox(),
        SizedBox(
          width: 50,
          child: IconButton(
            icon: Icon(
              _flashIsSwitchOn ? Icons.flash_on : Icons.flash_off,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () {
              setState(() {
                _flashIsSwitchOn = !_flashIsSwitchOn;
              });
              _flashIsSwitchOn
                  ? widget.cameraController.setFlashMode(FlashMode.torch)
                  : widget.cameraController.setFlashMode(FlashMode.off);
            },
          ),
        ),
      ],
    );
  }
}
