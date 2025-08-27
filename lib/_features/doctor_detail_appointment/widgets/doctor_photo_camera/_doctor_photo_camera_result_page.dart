import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/doctor_image_material.dart';
import '../../routes/doctor_active_appointment_route.dart';
import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';

class DoctorPhotoCameraResultPage extends StatelessWidget {
  const DoctorPhotoCameraResultPage({super.key, required this.image});

  final XFile image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
        child: Stack(
          children: [
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

                        // todo save to file

                        context.read<DoctorAppointmentMaterialsBloc>().add(
                          AddImageMaterialEvent(
                            imageMaterial: DoctorImageMaterial(imagePath: image.path),
                          ),
                        );
                        context.goNamed(DoctorActiveAppointmentRoute.name);
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
