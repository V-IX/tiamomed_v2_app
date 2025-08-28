import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as path;
import 'package:video_player/video_player.dart';

import '../../../../_shared/widgets/dialogs/basic_alert_dialog.dart';
import '../doctor_video_camera/player_button.dart';

class DoctorAppointmentVideoPlayerPage extends StatefulWidget {
  const DoctorAppointmentVideoPlayerPage({super.key, required this.videoPath});

  final String videoPath;

  @override
  State<DoctorAppointmentVideoPlayerPage> createState() => _DoctorAppointmentVideoPlayerPageState();
}

class _DoctorAppointmentVideoPlayerPageState extends State<DoctorAppointmentVideoPlayerPage> {

  late VideoPlayerController _videoPlayerController;


  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  Future<void> _initVideoPlayer() async {
    try {
      _videoPlayerController = VideoPlayerController.file(File(widget.videoPath));
      await _videoPlayerController.initialize();
      await _videoPlayerController.setLooping(true);
    } catch(error) {
      if(mounted){
        basicAlertDialog(context: context, title: 'Ошибка', desc: 'При окрытии видео возникли проблемы');
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: _initVideoPlayer(),
          builder: (BuildContext context, AsyncSnapshot<void> state) {
            if (state.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Stack(
                children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).viewPadding.top,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.arrow_back)
                          ),
                          SizedBox(width: 6),
                          Text(path.basename(widget.videoPath), maxLines: 1),
                          SizedBox(width: 6),
                          SizedBox(width: 32),
                        ],
                      ),
                      Expanded(child: VideoPlayer(_videoPlayerController)),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Column(
                      children: <Widget>[

                        VideoProgressIndicator(
                            _videoPlayerController,
                            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            allowScrubbing: true,
                            colors: const VideoProgressColors(
                                playedColor: Colors.pink
                            )
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
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
                                    onTap: ()  {
                                      if(_videoPlayerController.value.isPlaying) {
                                        _videoPlayerController.pause();
                                      } else {
                                        _videoPlayerController.play();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
