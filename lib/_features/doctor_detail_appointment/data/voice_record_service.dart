import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class VoiceRecordService {

  final AudioRecorder _record = AudioRecorder();

  Future<bool> hasPermission() async {
    return _record.hasPermission();
  }


  Future<void> startRecording() async {
    if (await hasPermission()) {

      final Directory directory = await getApplicationDocumentsDirectory();
      final Directory folderPath = Directory('${directory.path}/material_of_record/');

      final String filePath;

      if(folderPath.existsSync()){
        filePath = '${folderPath.path}AUDIO_${DateFormat("yyyyMMdd_hhmmss").format(DateTime.now())}.m4p';
      } else {
        final Directory newFolderPath = await folderPath.create(recursive: true);
        filePath = '${newFolderPath.path}AUDIO_${DateFormat("yyyyMMdd_hhmmss").format(DateTime.now())}.m4p';
      }

      await _record.start(
        const RecordConfig(),
        path: filePath,
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
