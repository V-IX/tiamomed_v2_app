import 'dart:io';

import 'package:camera/camera.dart' hide ImageFormat;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import '../../models/doctor_video_material.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';
import 'player_button.dart';

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
    } catch (error) {
      Logger().e(error.toString());
    }
  }

  Future<String?> _saveVideo() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final Directory folderPath = Directory('${directory.path}/material_of_record/');
      final String? videoPath;
      if (folderPath.existsSync()) {
        final File file = File(
          "${folderPath.path}VIDEO_${DateFormat("yyyyMMdd_hhmmss").format(DateTime.now())}.mp4",
        );
        await file.writeAsBytes(await File(widget.file.path).readAsBytes());
        videoPath = file.path;
      } else {
        final Directory newFolderPath = await folderPath.create(recursive: true);
        final File file = File(
          "${newFolderPath.path}VIDEO_${DateFormat("yyyyMMdd_hhmmss").format(DateTime.now())}.mp4",
        );
        await file.writeAsBytes(await File(widget.file.path).readAsBytes());
        videoPath = file.path;
      }
      return videoPath;
    } catch (error) {
      Logger().e(error.toString());
    }
    return null;
  }

  Future<String?> _makeThumbnail(String path) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final Directory folderPath = Directory('${directory.path}/material_of_record/');
    final String thumbnailPath;
    if (folderPath.existsSync()) {
      thumbnailPath = folderPath.path;
    } else {
      final Directory newFolderPath = await folderPath.create(recursive: true);
      thumbnailPath = newFolderPath.path;
    }

    return VideoThumbnail.thumbnailFile(video: path, thumbnailPath: thumbnailPath, quality: 75);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initVideoPlayer(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: <Widget>[
                VideoPlayer(_videoPlayerController),
                Positioned(
                  bottom: MediaQuery.of(context).padding.bottom,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: <Widget>[
                      VideoProgressIndicator(
                        _videoPlayerController,
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        allowScrubbing: true,
                        colors: const VideoProgressColors(playedColor: Colors.pink),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: const Icon(
                                Icons.clear_outlined,
                                color: Colors.white,
                                size: 32.0,
                              ),
                            ),
                            const SizedBox(width: 26.0),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const ShapeDecoration(
                                shape: CircleBorder(),
                                color: Colors.black26,
                              ),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: PlayerButton(
                                  onTap: () {
                                    if (_videoPlayerController.value.isPlaying) {
                                      _videoPlayerController.pause();
                                    } else {
                                      _videoPlayerController.play();
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 26.0),
                            IconButton(
                              onPressed: () async {
                                final String? videoPath = await _saveVideo();
                                if (videoPath != null && context.mounted) {
                                  final String? thumbnailPath = await _makeThumbnail(videoPath);

                                  context.read<DoctorAppointmentMaterialsBloc>().add(
                                    AddVideoMaterialEvent(
                                      videoMaterial: DoctorVideoMaterial(
                                        previewImagePath: thumbnailPath ?? '',
                                        videoPath: videoPath,
                                      ),
                                    ),
                                  );
                                  context.pop();
                                }
                              },
                              icon: const Icon(Icons.check, color: Colors.white, size: 32.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
