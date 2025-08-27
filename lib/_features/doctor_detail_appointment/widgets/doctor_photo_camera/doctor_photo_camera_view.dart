import 'dart:math';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../routes/doctor_photo_camera_result_route.dart';
import 'camera_focus_circle.dart';
import 'camera_grid.dart';
import 'doctor_photo_camera_bar.dart';
import 'doctor_photo_camera_control_bar.dart';

class DoctorPhotoCameraView extends StatefulWidget {
  const DoctorPhotoCameraView({
    super.key,
    required this.controller,
    required this.minZoom,
    required this.maxZoom,
  });

  final CameraController controller;
  final double minZoom;
  final double maxZoom;

  @override
  State<DoctorPhotoCameraView> createState() => _DoctorPhotoCameraViewState();
}

class _DoctorPhotoCameraViewState extends State<DoctorPhotoCameraView> {
  double _focusPosX = 0;
  double _focusPosY = 0;

  double _currentZoomLevel = 1.0;

  bool _isShowingFocusCircle = false;
  bool _isShowingGrid = true;
  bool _isShowingZoomText = false;
  bool _isShowingZoomSlider = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Align(
            child: GestureDetector(
              onTapUp: (TapUpDetails details) {
                _onTap(details);
              },
              child: CameraPreview(
                widget.controller,
                child: Stack(
                  children: [
                    if (_isShowingGrid) const CameraGrid(),
                    if (_isShowingFocusCircle)
                      Positioned(
                        top: _focusPosY - 30,
                        left: _focusPosX - 30,
                        child: const CameraFocusCircle(),
                      ),
                    if (_isShowingZoomSlider) Positioned(
                      bottom: 50,
                      left: 22,
                      right: 22,
                      child: _zoomSlider()
                    ),
                  ],
                ),
              ),
            ),
          ),
          DoctorPhotoCameraBar(
            cameraController: widget.controller,
            isShowingZoomText: _isShowingZoomText,
            currentZoomLevel: _currentZoomLevel,
          ),
          Positioned(
            bottom: 22,
            left: 22,
            right: 22,
            child: DoctorPhotoCameraControlBar(
              onZoomTap: () {
                setState(() {
                  _isShowingZoomText = !_isShowingZoomText;
                  _isShowingZoomSlider = !_isShowingZoomSlider;
                });
              },
              onGridTap: () {
                setState(() {
                  _isShowingGrid = !_isShowingGrid;
                });
              },
              takePicture: () async {
                final XFile file = await widget.controller.takePicture();

                if(context.mounted){
                  context.goNamed(DoctorPhotoCameraResultRoute.name, extra: file);
                }

              },
              isShowingGrid: _isShowingGrid,
            ),
          ),
        ],
      ),
    );
  }

  Widget _zoomSlider() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Slider(
        min: widget.minZoom,
        max: widget.maxZoom,
        value: _currentZoomLevel,
        activeColor: const Color(0xFFFF0066),
        onChangeEnd: (_) {
          Future<void>.delayed(const Duration(seconds: 2)).then((_) {
            setState(() {
              _isShowingZoomText = false;
              _isShowingZoomSlider = false;
            });
          });
        },
        onChanged: (double value) {
          setState(() {
            _isShowingZoomText = true;
          });

          final double newValue = roundNumber(value, 1);
          setState(() {
            _currentZoomLevel = newValue;
          });
          widget.controller.setZoomLevel(newValue);
        },
      ),
    );
  }

  Future<void> _onTap(TapUpDetails details) async {
    if (widget.controller.value.isInitialized) {
      _isShowingFocusCircle = true;
      _focusPosX = details.localPosition.dx;
      _focusPosY = details.localPosition.dy;

      final double fullWidth = MediaQuery.of(context).size.width;
      final double cameraHeight = fullWidth * widget.controller.value.aspectRatio;

      final double xp = _focusPosX / fullWidth;
      final double yp = _focusPosY / cameraHeight;

      final Offset point = Offset(xp, yp);

      // Manually focus
      await widget.controller.setFocusPoint(point);

      // Manually set light exposure
      //controller.setExposurePoint(point);

      setState(() {
        Future<dynamic>.delayed(const Duration(seconds: 2)).whenComplete(() {
          setState(() {
            _isShowingFocusCircle = false;
          });
        });
      });
    }
  }

  double roundNumber(double value, int places) {
    final num val = pow(10.0, places);
    return (value * val).round().toDouble() / val;
  }
}
