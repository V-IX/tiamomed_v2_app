import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'doctor_photo_camera_view.dart';

class DoctorPhotoCameraPage extends StatefulWidget {
  const DoctorPhotoCameraPage({super.key});

  @override
  State<DoctorPhotoCameraPage> createState() => _DoctorPhotoCameraPageState();
}

class _DoctorPhotoCameraPageState extends State<DoctorPhotoCameraPage> {
  late final CameraController _cameraController;
  double _minZoom = 0.0;
  double _maxZoom = 0.0;

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }


  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }


  Future<void> _initCamera() async {
    final List<CameraDescription> cameras = await availableCameras();

    _cameraController = CameraController(cameras.first, ResolutionPreset.ultraHigh);

    await _cameraController.initialize();
    final double minZoom = await _cameraController.getMinZoomLevel();
    final double maxZoom = await _cameraController.getMaxZoomLevel();

    setState(() {
      _minZoom = minZoom;
      _maxZoom = maxZoom;
      _isLoading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: switch (_isLoading) {
        true => const Center(child: CircularProgressIndicator()),
        false => DoctorPhotoCameraView(
          controller: _cameraController,
          minZoom: _minZoom,
          maxZoom: _maxZoom,
        ),
      },
    );
  }
}
