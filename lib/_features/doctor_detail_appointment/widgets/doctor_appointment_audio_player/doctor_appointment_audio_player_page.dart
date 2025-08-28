import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';

class DoctorAppointmentAudioPlayerPage extends StatefulWidget {
  const DoctorAppointmentAudioPlayerPage({super.key, required this.index});

  final int index;

  @override
  State<DoctorAppointmentAudioPlayerPage> createState() => _DoctorAppointmentAudioPlayerPageState();
}

class _DoctorAppointmentAudioPlayerPageState extends State<DoctorAppointmentAudioPlayerPage> {

  late AudioPlayer player = AudioPlayer();
  bool isPlay = false;
  late int _currentIndex;


  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  String get _durationText => _duration?.toString().split('.').first ?? '';
  String get _positionText => _position?.toString().split('.').first ?? '';

  bool get _isPlaying => _playerState == PlayerState.playing;


  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((Duration duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
          (Duration p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((PlayerState state) {
          setState(() {
            _playerState = state;
          });
        });
  }

  Future<void> _setAudio(String path) async {
    await player.setSource(DeviceFileSource(path));
    await player.resume();
  }

  @override
  void initState() {
    _currentIndex = widget.index;
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);
    // Start the player as soon as the app is displayed.
    _playerState = player.state;
    player.getDuration().then(
          (Duration? value) => setState(() {
        _duration = value;
      }),
    );
    player.getCurrentPosition().then(
          (Duration? value) => setState(() {
        _position = value;
      }),
    );
    _initStreams();
    super.initState();
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    player.dispose();
    super.dispose();
  }

  Future<void> _play() async {
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointmentMaterialsBloc, DoctorAppointmentMaterialsState>(
  builder: (BuildContext context, DoctorAppointmentMaterialsState state) {

    if(player.source == null) {
      _setAudio(state.audios[_currentIndex].audioPath);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Аудио плеер'),
        centerTitle: true,
      ),
      body: Container(
        margin: MediaQuery.of(context).viewPadding,
        padding: const EdgeInsets.all(22),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20)
              ),
              child:  const Icon(Icons.music_note, size: 254, color: Colors.black45),
            ),
            const SizedBox(height: 22),
            Text(basename(state.audios[_currentIndex].audioPath)),
            Text('${_currentIndex + 1} / ${state.audios.length}'),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: Slider(
                activeColor: const Color(0xFFFF0066),
                inactiveColor: Colors.black26,
                onChanged: (double value) {
                  final Duration? duration = _duration;
                  if (duration == null) {
                    return;
                  }
                  final double position = value * duration.inMilliseconds;
                  player.seek(Duration(milliseconds: position.round()));
                },
                value: (_position != null &&
                    _duration != null &&
                    _position!.inMilliseconds > 0 &&
                    _position!.inMilliseconds < _duration!.inMilliseconds)
                    ? _position!.inMilliseconds / _duration!.inMilliseconds
                    : 0.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  _position != null ? _positionText : '0:00:00',
                  style: const TextStyle(fontSize: 12.0),
                ),
                Text(
                  _duration != null ? _durationText : '0:00:00',
                  style: const TextStyle(fontSize: 12.0),
                )
              ],
            ),
            const SizedBox(height: 44),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  key: const Key('back_button'),
                  onPressed: () {
                    setState(() {
                      if(_currentIndex - 1 >= 0) {
                        _currentIndex--;
                      } else {
                        _currentIndex = state.audios.length - 1;
                      }
                    });
                    _setAudio(state.audios[_currentIndex].audioPath);
                  },
                  iconSize: 44.0,
                  icon: const Icon(Icons.skip_previous),
                ),
                const SizedBox(width: 22),
                IconButton.filled(
                  key: const Key('play_button'),
                  style: ButtonStyle(
                      backgroundColor: WidgetStateColor.resolveWith((Set<WidgetState> states) => const Color(0xFFFF0066))
                  ),
                  onPressed: _isPlaying ? _pause : _play ,
                  iconSize: 64.0,
                  icon:  _isPlaying ? const Icon(Icons.pause) : const Icon(Icons.play_arrow),
                ),
                const SizedBox(width: 22),
                IconButton(
                  key: const Key('next_button'),
                  onPressed: () {
                    setState(() {
                      if(_currentIndex + 1 < state.audios.length) {
                        _currentIndex++;
                      } else {
                        _currentIndex = 0;
                      }
                    });
                    _setAudio(state.audios[_currentIndex].audioPath);
                  },
                  iconSize: 44.0,
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);
  }

}
