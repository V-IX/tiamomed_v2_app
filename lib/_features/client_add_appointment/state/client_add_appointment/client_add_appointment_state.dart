part of 'client_add_appointment_bloc.dart';

enum ClientAddAppointmentStatus { init, loading, success, error }

extension CreateAppointmentStatusCheck on ClientAddAppointmentStatus {
  bool get isInit => this == ClientAddAppointmentStatus.init;

  bool get isLoading => this == ClientAddAppointmentStatus.loading;

  bool get isSuccess => this == ClientAddAppointmentStatus.success;

  bool get isError => this == ClientAddAppointmentStatus.error;
}

class ClientAddAppointmentState {
  ClientAddAppointmentState({
    this.status = ClientAddAppointmentStatus.init,
    this.selectedServices = const <DoctorService>[],
    this.selectedDoctor,
  });

  final ClientAddAppointmentStatus status;
  final Doctor? selectedDoctor;
  final List<DoctorService> selectedServices;

  ClientAddAppointmentState copyWith({
    ClientAddAppointmentStatus? status,
    Doctor? selectedDoctor,
    List<DoctorService>? selectedServices,
  }) {
    return ClientAddAppointmentState(
      status: status ?? this.status,
      selectedDoctor: selectedDoctor ?? this.selectedDoctor,
      selectedServices: selectedServices ?? this.selectedServices,
    );
  }
}
