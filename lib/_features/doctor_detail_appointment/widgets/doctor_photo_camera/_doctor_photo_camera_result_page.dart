import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/doctor_image_material.dart';
import '../../routes/doctor_active_appointment_route.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';

class DoctorPhotoCameraResultPage extends StatelessWidget {
  const DoctorPhotoCameraResultPage({super.key, required this.image});

  final XFile image;

  Future<String?> _saveImage() async {
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final Directory folderPath = Directory('${directory.path}/material_of_record/');
      final String resultPath;
      if (folderPath.existsSync()) {
        resultPath = folderPath.path;
      } else {
        final Directory newFolderPath = await folderPath.create(recursive: true);
        resultPath = newFolderPath.path;
      }

      final File file = File("$resultPath/image_${DateFormat("yyyyMMdd_hhmmss").format(DateTime.now())}.jpg");
      final img.Image? imageRes = await img.decodeImageFile(image.path);

      img.drawString(
        imageRes!,
        DateFormat('dd.MM.yyyy HH:mm').format(DateTime.now()),
        font: img.arial48,
        color: img.ColorRgb8(0,0,0),
        x: 20,
        y: 20
      );

      await img.writeFile(file.path, img.encodeJpg(imageRes));
      File(image.path).deleteSync();
      return file.path;

    } catch(error) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        child: Stack(
          children: <Widget>[
            Center(child: Image.file(File(image.path), fit: BoxFit.fitWidth)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                color: Colors.black26,
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.clear_outlined, color: Colors.white, size: 32.0),
                    ),
                    const SizedBox(width: 64.0),
                    IconButton(
                      onPressed: () async {
                        final String? filePath = await _saveImage();
                        if(filePath != null && context.mounted) {
                          context.read<DoctorAppointmentMaterialsBloc>().add(
                            AddImageMaterialEvent(
                              imageMaterial: DoctorImageMaterial(imagePath: filePath),
                            ),
                          );
                          context.goNamed(DoctorActiveAppointmentRoute.name);
                        }
                      },
                      icon: const Icon(Icons.check, color: Colors.white, size: 32.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
