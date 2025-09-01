import '../../../models/doctor/cabinet.dart';
import '../../../models/doctor/datetime_interval.dart';
import '../../../models/doctor/doctor_service.dart';
import '../../../models/doctor/doctor.dart';
import 'doctor_api_service.dart';

class DoctorRepository {
  DoctorRepository({required DoctorApiService doctorApiService})
    : _doctorApiService = doctorApiService;

  final DoctorApiService _doctorApiService;

  Future<Doctor> getDoctorInfo() async {
    return _doctorApiService.getDoctorInfo();
  }

  Future<List<Doctor>> getDoctors() async {
    return _doctorApiService.getDoctors();
  }

  Future<List<DoctorService>> getDoctorServices(String? doctorId) async {
    return _doctorApiService.getDoctorServices(doctorId: doctorId);
  }

  Future<List<DateTimeInterval>> getDoctorBusyIntervalList({
    required String doctorId,
    required List<DoctorService> selectedServices,
  }) async {
    return _doctorApiService.getDoctorBusyIntervalList(
      doctorId: doctorId,
      selectedServices: selectedServices,
    );
  }

  Future<List<Cabinet>> getDoctorCabinets(String? doctorId) async {
    return _doctorApiService.getDoctorCabinets(doctorId: doctorId);
  }

  Future<List<DateTimeInterval>> getDoctorsDateTimeIntervals() async {
    return _doctorApiService.getDoctorsDateTimeIntervals();
  }

}
