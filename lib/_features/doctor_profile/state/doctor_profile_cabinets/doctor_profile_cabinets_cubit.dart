import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../../_shared/models/doctor/cabinet.dart';
import '../../data/doctor_repository.dart';

part 'doctor_profile_cabinets_state.dart';

class DoctorProfileCabinetsCubit extends Cubit<DoctorProfileCabinetsState> {
  DoctorProfileCabinetsCubit({required DoctorRepository doctorRepository})
    : _doctorRepository = doctorRepository,
      super(DoctorProfileCabinetsInitial());

  final DoctorRepository _doctorRepository;
  final Logger _logger = Logger();

  Future<void> loadCabinets() async {
    emit(DoctorProfileCabinetsLoading());
    try {
      final List<Cabinet> cabinets = await _doctorRepository.getDoctorCabinets(null);
      emit(DoctorProfileCabinetsLoaded(cabinets: cabinets));
    } catch (error) {
      _logger.e(error);
      emit(DoctorProfileCabinetsError(message: error.toString()));
    }
  }
}
