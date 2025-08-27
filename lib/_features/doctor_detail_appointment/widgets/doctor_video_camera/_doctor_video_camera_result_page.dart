import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DoctorVideoCameraResultPage extends StatefulWidget {
  const DoctorVideoCameraResultPage({super.key, required this.file});

  final XFile file;

  @override
  State<DoctorVideoCameraResultPage> createState() => _DoctorVideoCameraResultPageState();
}

class _DoctorVideoCameraResultPageState extends State<DoctorVideoCameraResultPage> {

  late VideoPlayerController _videoPlayerController;


  Future<void> _initVideoPlayer() async {
    try {
      _videoPlayerController = VideoPlayerController.file(File(widget.file.path));
      await _videoPlayerController.initialize();
      await _videoPlayerController.setLooping(true);
    } catch(error) {

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initVideoPlayer(),
        builder: (context,snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                VideoPlayer(_videoPlayerController),
              ],
            );
          }
        },
      )
    );
  }
}
