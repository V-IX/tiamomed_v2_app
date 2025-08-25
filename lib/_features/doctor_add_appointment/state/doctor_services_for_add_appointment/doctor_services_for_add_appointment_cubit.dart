import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'doctor_services_for_add_appointment_state.dart';

class DoctorServicesForAddAppointmentCubit extends Cubit<DoctorServicesForAddAppointmentState> {
  DoctorServicesForAddAppointmentCubit() : super(DoctorServicesForAddAppointmentInitial());
}
