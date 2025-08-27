import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../../../utils/other/date_util.dart';
import 'doctor_video_camera_control_bar.dart';
import 'video_camera_timer.dart';

class DoctorVideoCameraView extends StatelessWidget {
  const DoctorVideoCameraView({super.key, required this.cameraController});

  final CameraController cameraController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(child: CameraPreview(cameraController)),
          if(cameraController.value.isRecordingVideo)
            Positioned(
              top: 70,
              right: 0,
              left: 0,
              child: VideoCameraTimer(timeInSecond: 1111),
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
              cameraController: cameraController
            )
          )
        ],
      ),
    );
  }
}
