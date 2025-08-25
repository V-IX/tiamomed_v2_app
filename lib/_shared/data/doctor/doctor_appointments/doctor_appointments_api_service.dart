import '../../../../utils/api_client/api_client.dart';
import '../../../models/appointment/new_appointment.dart';
import '../../../models/doctor/appointment_count.dart';
import '../../../models/doctor/doctor_appointment.dart';

class DoctorAppointmentsApiService {
  DoctorAppointmentsApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<DoctorAppointment>> getAppointmentsByDate({
    required String date,
  }) async {
    return <DoctorAppointment>[
      DoctorAppointment(id: '1', status: DoctorAppointmentStatus.open, startTime: '09:00', endTime: '09:30', date: date, clientName: 'John Doe'),
      DoctorAppointment(id: '2', status: DoctorAppointmentStatus.completed, startTime: '09:30', endTime: '10:00', date: date, clientName: 'Jane Smith'),
      DoctorAppointment(id: '3', status: DoctorAppointmentStatus.open, startTime: '10:00', endTime: '10:30', date: date, clientName: 'Alice Johnson'),
      DoctorAppointment(id: '4', status: DoctorAppointmentStatus.open, startTime: '10:30', endTime: '11:00', date: date, clientName: 'Bob Brown'),
      DoctorAppointment(id: '5', status: DoctorAppointmentStatus.open, startTime: '11:00', endTime: '11:30', date: date, clientName: 'Charlie Davis'),
      DoctorAppointment(id: '6', status: DoctorAppointmentStatus.completed, startTime: '11:30', endTime: '12:00', date: date, clientName: 'Diana Evans'),
      DoctorAppointment(id: '7', status: DoctorAppointmentStatus.open, startTime: '13:00', endTime: '13:30', date: date, clientName: 'Edward Green'),
      DoctorAppointment(id: '8', status: DoctorAppointmentStatus.open, startTime: '13:30', endTime: '14:00', date: date, clientName: 'Fiona Harris'),
      DoctorAppointment(id: '9', status: DoctorAppointmentStatus.close, startTime: '14:00', endTime: '14:30', date: date, clientName: 'George Irwin'),
      DoctorAppointment(id: '10', status: DoctorAppointmentStatus.open, startTime: '14:30', endTime: '15:00', date: date, clientName: 'Hannah Jones'),
      DoctorAppointment(id: '11', status: DoctorAppointmentStatus.completed, startTime: '15:00', endTime: '15:30', date: date, clientName: 'Ian King'),
      DoctorAppointment(id: '12', status: DoctorAppointmentStatus.open, startTime: '15:30', endTime: '16:00', date: date, clientName: 'Julia Lee'),
      DoctorAppointment(id: '13', status: DoctorAppointmentStatus.open, startTime: '16:00', endTime: '16:30', date: date, clientName: 'Kevin Miller'),
      DoctorAppointment(id: '14', status: DoctorAppointmentStatus.completed, startTime: '16:30', endTime: '17:00', date: date, clientName: 'Laura Nelson'),
      DoctorAppointment(id: '15', status: DoctorAppointmentStatus.open, startTime: '17:00', endTime: '17:30', date: date, clientName: 'Michael Olsen'),
      DoctorAppointment(id: '16', status: DoctorAppointmentStatus.open, startTime: '08:00', endTime: '08:30', date: date, clientName: 'Nancy Parker'),
      DoctorAppointment(id: '17', status: DoctorAppointmentStatus.open, startTime: '08:30', endTime: '09:00', date: date, clientName: 'Oscar Quinn'),
      DoctorAppointment(id: '18', status: DoctorAppointmentStatus.completed, startTime: '17:30', endTime: '18:00', date: date, clientName: 'Patricia Roberts'),
      DoctorAppointment(id: '19', status: DoctorAppointmentStatus.open, startTime: '18:00', endTime: '18:30', date: date, clientName: 'Quentin Scott'),
      DoctorAppointment(id: '20', status: DoctorAppointmentStatus.open, startTime: '18:30', endTime: '19:00', date: date, clientName: 'Rachel Taylor'),
    ];
  }

  Future<List<AppointmentCount>> getAppointmentCounts({
    required String startDate,
    required String endDate,
  }) async {
    // Generate fake data for the next 10 days after today
    final DateTime today = DateTime.now();
    final List<AppointmentCount> appointmentCounts = <AppointmentCount>[];
    for (int i = 0; i < 10; i++) {
      final DateTime date = today.add(Duration(days: i + 1));
      // Generate a random count between 0 and 20
      final int count = DateTime.now().millisecond % 21;
      appointmentCounts.add(
        AppointmentCount(
          date: '${date.year}.${date.month.toString().padLeft(2, '0')}.${date.day.toString().padLeft(2, '0')}',
          count: count,
        ),
      );
    }
    return appointmentCounts;
  }

  Future<void> addAppointment({required NewAppointment newAppointment}) async {
    return;
  }

}
