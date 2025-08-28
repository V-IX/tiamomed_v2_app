import 'package:flutter/material.dart';

class SelectImageResourceBottomSheet extends StatelessWidget {
  const SelectImageResourceBottomSheet({super.key, required this.addFromCameraCallback, required this.addFromGalleryCallback});

  final VoidCallback addFromCameraCallback;

  final VoidCallback addFromGalleryCallback;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
          margin: const EdgeInsets.only(bottom: 44),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  addFromCameraCallback();
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const Row(children: [Text('Камера')]),
                ),
              ),
              const Divider(color: Colors.black12),
              GestureDetector(
                onTap: addFromGalleryCallback,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: const Row(children: [Text('Проводник')]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
