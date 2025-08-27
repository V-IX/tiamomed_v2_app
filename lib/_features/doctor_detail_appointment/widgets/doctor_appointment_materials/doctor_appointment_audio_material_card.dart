
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../../../../utils/other/file_utils.dart';
import '../../models/doctor_audio_material.dart';

class AudioRecordMaterialCard extends StatelessWidget {
  const AudioRecordMaterialCard({
    super.key, required this.audioMaterial, required this.onCheckTap,
  });

  final DoctorAudioMaterial audioMaterial;
  final VoidCallback onCheckTap;

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                ),
              ),
              Flexible(
                flex: 5,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              p.basename(audioMaterial.audioPath),
                              style: const TextStyle(
                                color: Color(0xFF282F41),
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Text(
                            getFileSize(audioMaterial.audioPath),
                            style: const TextStyle(
                              color: Color(0xFF7C8085),
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Transform.scale(
                  scale: 1.1,
                  child: Checkbox(
                    shape: const CircleBorder(),
                    splashRadius: 20,
                    overlayColor: WidgetStateColor.resolveWith((Set<WidgetState> states) => const Color(0xFFD8E2A2)),
                    activeColor: const Color(0xFFD8E2A2),
                    checkColor: const Color(0xFF9EB23B),
                    side: const BorderSide(color: Colors.black26),
                    value: audioMaterial.isSelected,
                    onChanged:(bool? check) => onCheckTap()
                  ),
                )
              )
            ],
          ),

        ],
      )
    );
  }

}
