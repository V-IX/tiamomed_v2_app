import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../utils/other/date_util.dart';
import 'doctor_video_camera_control_bar.dart';
import 'video_camera_timer.dart';

class DoctorVideoCameraView extends StatefulWidget {
  const DoctorVideoCameraView({super.key, required this.cameraController});

  final CameraController cameraController;

  @override
  State<DoctorVideoCameraView> createState() => _DoctorVideoCameraViewState();
}

class _DoctorVideoCameraViewState extends State<DoctorVideoCameraView> {

  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          if(widget.cameraController.value.isInitialized)
            Align(child: CameraPreview(widget.cameraController)),
          if(widget.cameraController.value.isRecordingVideo)
            Positioned(
              top: 70,
              right: 0,
              left: 0,
              child: VideoCameraTimer(timeInSecond: _timer.tick),
            )
          else
            Align(
              alignment: AlignmentDirectional.topStart,
              child: Container(
                  margin: EdgeInsets.only(top: 22, left: 20),
                  child: RotatedBox(
                    quarterTurns: 45,
                    child: IconButton(
                        style: FilledButton.styleFrom(
                          padding: EdgeInsets.all(12),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.black26,
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                        icon: Icon(Icons.close, color: Colors.white, size: 32)
                    ),
                  )
              ),
            ),
          Positioned(
            bottom: 22,
            left: 0,
            right: 0,
            child: DoctorVideoCameraControlBar(
              cameraController: widget.cameraController,
              startTimer: () {
                _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
                  setState(() {

                  });
                });
              },
            )
          )
        ],
      ),
    );
  }
}
