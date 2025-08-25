import '../../../_shared/models/doctor/cabinet.dart';
import '../../../_shared/models/doctor/datetime_interval.dart';
import '../../../_shared/models/doctor/doctor_service.dart';
import '../../../utils/api_client/api_client.dart';
import '../models/doctor.dart';

class DoctorApiService {
  DoctorApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<Doctor> getDoctorInfo() async {
    return Doctor.doctor;
  }

  Future<List<Doctor>> getDoctors() async {
    return <Doctor>[
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
      Doctor.randomId(),
    ];
  }

  Future<List<DoctorService>> getDoctorServices({String? doctorId}) async {
    return <DoctorService>[];
  }

  Future<List<DateTimeInterval>> getDoctorBusyIntervalList({required String doctorId, required List<DoctorService> selectedServices}) async {
    return <DateTimeInterval>[];
  }

  Future<List<Cabinet>> getDoctorCabinets({String? doctorId}) async {
    return <Cabinet>[];
  }

  Future<List<DateTimeInterval>> getDoctorsDateTimeIntervals() async {
    return <DateTimeInterval>[];
  }

}
