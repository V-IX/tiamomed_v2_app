import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/voice_record_service.dart';

final Provider<VoiceRecordService> voiceRecordServiceProvider = Provider<VoiceRecordService>(
  create: (BuildContext context) => VoiceRecordService(),
  dispose: (BuildContext context, VoiceRecordService service){
    service.dispose();
  },
);
