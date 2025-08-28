import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../state/doctor_appointment_materials/doctor_appointment_materials_bloc.dart';

class DoctorAppointmentImageGalleryPage extends StatefulWidget {
  const DoctorAppointmentImageGalleryPage({super.key, required this.initialIndex});

  final int initialIndex;

  @override
  State<DoctorAppointmentImageGalleryPage> createState() =>
      _DoctorAppointmentImageGalleryPageState();
}

class _DoctorAppointmentImageGalleryPageState extends State<DoctorAppointmentImageGalleryPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAppointmentMaterialsBloc, DoctorAppointmentMaterialsState>(
      builder: (BuildContext context, DoctorAppointmentMaterialsState state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Фото галерея'), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Stack(
              children: <Widget>[
                CarouselSlider.builder(
                  options: CarouselOptions(
                    initialPage: widget.initialIndex,
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height,
                    onPageChanged: (int index, CarouselPageChangedReason reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  itemCount: state.images.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const BoxDecoration(color: Colors.transparent),
                      child: Image.file(File(state.images[index].imagePath), fit: BoxFit.contain),
                    );
                  },
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  child: ColoredBox(
                    color: Colors.white30,
                    child: Column(
                      children: <Widget>[
                        Text(basename(state.images[_currentIndex].imagePath)),
                        Text('${_currentIndex + 1} / ${state.images.length}'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
