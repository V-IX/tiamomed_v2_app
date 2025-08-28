import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/other/void_callback_util.dart';

class FeedbackImagePicker extends StatelessWidget {
  const FeedbackImagePicker({
    super.key,
    required this.images,
    required this.addImagePath,
    required this.removeImagePath,
  });

  final List<String> images;
  final VoidCallbackWithString addImagePath;
  final VoidCallbackWithInt removeImagePath;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 14.0,
      runSpacing: 14.0,
      children: List.generate(3, (index) {
        if (index < images.length) {
          // Display existing image with a remove button
          return Stack(
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: SizedBox(
                  width: 86,
                  height: 86,
                  child: Image.file(File(images[index]), fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: -10,
                right: -10,
                child: GestureDetector(
                  onTap: () => removeImagePath(index),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: const Icon(Icons.close, color: Colors.white, size: 16),
                  ),
                ),
              ),
            ],
          );
        } else {
          // Display add image button
          return GestureDetector(
            onTap: () async {
              final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
              if (image != null) {
                addImagePath(image.path);
              }
            },
            child: Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                color: const Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Icon(Icons.add_circle_outline, size: 30, color: Colors.grey),
            ),
          );
        }
      }),
    );
  }
}
