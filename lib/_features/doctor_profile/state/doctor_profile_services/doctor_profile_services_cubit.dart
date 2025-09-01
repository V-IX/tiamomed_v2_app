import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../../_shared/models/doctor/doctor_service.dart';
import '../../../../_shared/models/doctor/doctor_service_type.dart';
import '../../../../_shared/data/doctor/doctor_info/doctor_repository.dart';

part 'doctor_profile_services_state.dart';

class DoctorProfileServicesCubit extends Cubit<DoctorProfileServicesState> {
  DoctorProfileServicesCubit({required DoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository,
        super(DoctorProfileServicesInitial());

  final DoctorRepository _doctorRepository;
  final Logger _logger = Logger();

  Future<void> loadServices() async {
    try {
      emit(DoctorProfileServicesLoading());
      final List<DoctorService> doctorServices = await _doctorRepository.getDoctorServices(null);
      if (doctorServices.isNotEmpty) {
        final List<DoctorServiceType> doctorServiceTypes = doctorServices
            .where((DoctorService item) => item.doctorServiceType != null).map(
                (DoctorService service) => service.doctorServiceType!
        ).toSet().toList();

        emit(DoctorProfileServicesLoaded(doctorServices: doctorServices,
            doctorServiceTypes: doctorServiceTypes));
      }
    } catch(e) {
      _logger.e(e);
      emit(DoctorProfileServicesError(message: e.toString()));
    }
  }}
