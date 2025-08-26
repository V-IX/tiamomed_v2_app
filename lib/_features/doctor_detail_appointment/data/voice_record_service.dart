import 'package:record/record.dart';

class VoiceRecordService {

  final AudioRecorder _record = AudioRecorder();

  Future<bool> hasPermission() async {
    return _record.hasPermission();
  }


  Future<void> startRecording(String path) async {
    if (await hasPermission()) {
      await _record.start(
        const RecordConfig(),
        path: path,
      );
    }
  }


  Future<String?> stopRecording() async {
    return _record.stop();
  }

  Future<bool> isRecording() async {
    return _record.isRecording();
  }

  Future<void> dispose() async {
    if(await _record.isRecording()){
      await _record.cancel();
    }
    await _record.dispose();
  }

}
