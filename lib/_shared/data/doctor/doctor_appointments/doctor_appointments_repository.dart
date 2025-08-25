import '../../../models/appointment/new_appointment.dart';
import '../../../models/doctor/appointment_count.dart';
import '../../../models/doctor/doctor_appointment.dart';
import 'doctor_appointments_api_service.dart';

class DoctorAppointmentsRepository {
  DoctorAppointmentsRepository({required DoctorAppointmentsApiService doctorAppointmentsApiService})
    : _doctorAppointmentsApiService = doctorAppointmentsApiService;

  final DoctorAppointmentsApiService _doctorAppointmentsApiService;

  Future<List<DoctorAppointment>> getAppointmentsByDate({
    required String date,
  }) async {
    return _doctorAppointmentsApiService.getAppointmentsByDate(date: date);
  }

  Future<List<AppointmentCount>> getAppointmentCounts({
    required String startDate,
    required String endDate,
  }) async {
    return _doctorAppointmentsApiService.getAppointmentCounts(startDate: startDate, endDate: endDate);
  }

  Future<void> addAppointment({required NewAppointment newAppointment}) async {
    return _doctorAppointmentsApiService.addAppointment(newAppointment: newAppointment);
  }

}
