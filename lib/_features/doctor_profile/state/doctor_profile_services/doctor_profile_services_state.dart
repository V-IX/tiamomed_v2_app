part of 'doctor_profile_services_cubit.dart';

@immutable
sealed class DoctorProfileServicesState {}

final class DoctorProfileServicesInitial extends DoctorProfileServicesState {}

final class DoctorProfileServicesLoading extends DoctorProfileServicesState {}

final class DoctorProfileServicesLoaded extends DoctorProfileServicesState {
  DoctorProfileServicesLoaded(
      {required this.doctorServices, required this.doctorServiceTypes});

  final List<DoctorService> doctorServices;
  final List<DoctorServiceType> doctorServiceTypes;
}

final class DoctorProfileServicesError extends DoctorProfileServicesState {
  DoctorProfileServicesError({required this.message});

  final String message;
}

