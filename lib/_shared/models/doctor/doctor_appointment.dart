class DoctorAppointment {
  DoctorAppointment({
    required this.id,
    required this.status,
    required this.startTime,
    required this.endTime,
    required this.date,
    required this.clientName,
  });

  final String id;
  final DoctorAppointmentStatus status;
  final String startTime;
  final String endTime;
  final String date;
  final String clientName;
}

enum DoctorAppointmentStatus {
  close('Закрыт'),
  open('Открыт'),
  completed('Завершен');

  const DoctorAppointmentStatus(this.text);

  final String text;

}
