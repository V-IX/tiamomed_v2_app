import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../../../../utils/other/file_utils.dart';
import '../../models/doctor_image_material.dart';

class DoctorAppointmentImageMaterialCard extends StatelessWidget {
  const DoctorAppointmentImageMaterialCard({
    super.key,
    required this.imageMaterial,
    required this.onCheckTap,
    required this.onTap,
  });

  final DoctorImageMaterial imageMaterial;
  final VoidCallback onCheckTap;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Flexible(
              flex: 5,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    height: 80,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.file(File(imageMaterial.imagePath), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            p.basename(imageMaterial.imagePath),
                            style: const TextStyle(
                              color: Color(0xFF282F41),
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          getFileSize(imageMaterial.imagePath),
                          style: const TextStyle(
                            color: Color(0xFF7C8085),
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
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
                  overlayColor: WidgetStateColor.resolveWith(
                    (Set<WidgetState> states) => const Color(0xFFD8E2A2),
                  ),
                  activeColor: const Color(0xFFD8E2A2),
                  checkColor: const Color(0xFF9EB23B),
                  side: const BorderSide(color: Colors.black26),
                  value: imageMaterial.isSelected,
                  onChanged: (bool? check) => onCheckTap(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
