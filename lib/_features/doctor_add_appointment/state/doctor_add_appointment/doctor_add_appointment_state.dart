part of 'doctor_add_appointment_bloc.dart';

enum DoctorAddAppointmentStatus { init, loading, success, error }

extension CreateAppointmentStatusCheck on DoctorAddAppointmentStatus {
  bool get isInit => this == DoctorAddAppointmentStatus.init;

  bool get isLoading => this == DoctorAddAppointmentStatus.loading;

  bool get isSuccess => this == DoctorAddAppointmentStatus.success;

  bool get isError => this == DoctorAddAppointmentStatus.error;
}

class DoctorAddAppointmentState {
  DoctorAddAppointmentState({
    this.status = DoctorAddAppointmentStatus.init,
    this.selectedServices = const <DoctorService>[],
    this.selectedDoctor,
  });

  final DoctorAddAppointmentStatus status;
  final Doctor? selectedDoctor;
  final List<DoctorService> selectedServices;
}
