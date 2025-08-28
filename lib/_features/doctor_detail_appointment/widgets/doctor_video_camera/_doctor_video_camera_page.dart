import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'doctor_video_camera_view.dart';

class DoctorVideoCameraPage extends StatefulWidget {
  const DoctorVideoCameraPage({super.key});

  @override
  State<DoctorVideoCameraPage> createState() => _DoctorVideoCameraPageState();
}

class _DoctorVideoCameraPageState extends State<DoctorVideoCameraPage> {

  late CameraController _cameraController;
  bool _isLoading = true;
  bool flash = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  @override
  void dispose() {
    _disposeCamera();
    super.dispose();
  }

  Future<void> _disposeCamera() async {
      if (_cameraController.value.isRecordingVideo) {
        await _cameraController.stopVideoRecording();
      }

      if(_cameraController.value.isInitialized) {
        await _cameraController.dispose();
      }
  }



  Future<void> _initCamera() async {
    try {
      final List<CameraDescription> cameras = await availableCameras();
      final CameraDescription back = cameras[0];
      _cameraController = CameraController(back, ResolutionPreset.high);
      await _cameraController.initialize();
      setState(() => _isLoading = false);
    } catch(error) {

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: switch(_isLoading || !_cameraController.value.isInitialized) {
        true => const Center(child: CircularProgressIndicator()),
        false => DoctorVideoCameraView(cameraController: _cameraController),
      },
    );
  }
}
