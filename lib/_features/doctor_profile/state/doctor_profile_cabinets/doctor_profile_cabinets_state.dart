part of 'doctor_profile_cabinets_cubit.dart';

@immutable
sealed class DoctorProfileCabinetsState {}

final class DoctorProfileCabinetsInitial extends DoctorProfileCabinetsState {}
final class DoctorProfileCabinetsLoading extends DoctorProfileCabinetsState {}
final class DoctorProfileCabinetsLoaded extends DoctorProfileCabinetsState {
  DoctorProfileCabinetsLoaded({required this.cabinets});

  final List<Cabinet> cabinets;
}
final class DoctorProfileCabinetsError extends DoctorProfileCabinetsState {
  DoctorProfileCabinetsError({required this.message});

  final String message;
}
