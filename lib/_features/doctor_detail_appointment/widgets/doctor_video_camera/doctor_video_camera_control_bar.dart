import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/doctor_video_camera_result_route.dart';

class DoctorVideoCameraControlBar extends StatefulWidget {
  const DoctorVideoCameraControlBar({super.key, required this.cameraController, required this.startTimer});

  final CameraController cameraController;
  final VoidCallback startTimer;

  @override
  State<DoctorVideoCameraControlBar> createState() => _DoctorVideoCameraControlBarState();
}

class _DoctorVideoCameraControlBarState extends State<DoctorVideoCameraControlBar> {
  bool _flashIsOn = false;

  Future<void> _recordTap() async {
    if (widget.cameraController.value.isRecordingVideo) {
      final XFile file = await widget.cameraController.stopVideoRecording();
      await widget.cameraController.dispose();
      if (mounted) {
        context.replaceNamed(DoctorVideoCameraResultRoute.name, extra: file);
      }

    } else {
      await widget.cameraController.prepareForVideoRecording();
      await widget.cameraController.startVideoRecording();
      widget.startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 85),
        SizedBox(
          width: 64,
          height: 64,
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: const CircleBorder(),
              backgroundColor: Colors.red,
            ),
            onPressed: _recordTap,
            child: Icon(
              widget.cameraController.value.isRecordingVideo ? Icons.stop : Icons.videocam,
            ),
          ),
        ),
        const SizedBox(width: 35),
        SizedBox(
          width: 50,
          child: IconButton(
            style: FilledButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.all(12),
              backgroundColor: Colors.black45,
            ),
            icon: Icon(
              _flashIsOn ? Icons.flash_on : Icons.flash_off,
              color: Colors.white,
              size: 22,
            ),
            onPressed: () {
              setState(() {
                _flashIsOn = !_flashIsOn;
              });
              _flashIsOn
                  ? widget.cameraController.setFlashMode(FlashMode.torch)
                  : widget.cameraController.setFlashMode(FlashMode.off);
            },
          ),
        ),
      ],
    );
  }
}
