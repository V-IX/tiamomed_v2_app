import 'dart:math';

class Doctor {
  Doctor({
    required this.id,
    required this.name,
    required this.doctorPosition,
    required this.profileImageUrl,
  });

  factory Doctor.randomId() {
    return Doctor(
      id: Random.secure().nextInt(1000).toString(),
      name: 'Алекс лютый',
      doctorPosition: DoctorInfo(id: '100', name: 'Врач'),
      profileImageUrl:''
    );
  }

  final String id;
  final String name;
  final DoctorInfo doctorPosition;
  final String profileImageUrl;

  static final Doctor doctor = Doctor(
    id: '100',
    name: 'Алекс лютый',
    doctorPosition: DoctorInfo(id: '100', name: 'Врач'),
    profileImageUrl:''
  );

}


class DoctorInfo {
  DoctorInfo({required this.id, required this.name});

  final String id;
  final String name;
}
