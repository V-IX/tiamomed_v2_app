import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../../../../_shared/models/doctor/datetime_interval.dart';
import '../../../../_shared/data/doctor/doctor_info/doctor_repository.dart';

part 'doctor_profile_datetime_intervals_state.dart';

class DoctorProfileDatetimeIntervalsCubit extends Cubit<DoctorProfileDatetimeIntervalsState> {
  DoctorProfileDatetimeIntervalsCubit({required DoctorRepository doctorRepository})
    : _doctorRepository = doctorRepository,
      super(DoctorProfileDatetimeIntervalsInitial());

  final DoctorRepository _doctorRepository;
  final Logger _logger = Logger();

  Future<void> loadIntervals() async {
    try {
      emit(DoctorProfileDatetimeIntervalsLoading());
      final List<DateTimeInterval> datetimeIntervals = await _doctorRepository
          .getDoctorsDateTimeIntervals();

      final Map<String, List<DateTimeInterval>> sortedDoctorTimeIntervalList =
          <String, List<DateTimeInterval>>{};
      for (final DateTimeInterval item in datetimeIntervals) {
        sortedDoctorTimeIntervalList.putIfAbsent(item.date, () => <DateTimeInterval>[]).add(item);
      }

      for (final List<DateTimeInterval> list in sortedDoctorTimeIntervalList.values) {
        list.sort(
          (DateTimeInterval a, DateTimeInterval b) =>
              a.timeInterval.timeN.compareTo(b.timeInterval.timeN),
        );
      }

      final List<String> sortedMonthList = sortedDoctorTimeIntervalList.keys
          .map((String date) => DateFormat('MM.yyyy').format(DateFormat('dd.MM.yyyy').parse(date)))
          .toSet()
          .toList();

      emit(DoctorProfileDatetimeIntervalsLoaded(intervals: sortedDoctorTimeIntervalList, months: sortedMonthList));

    } catch (error) {
      _logger.e(error);
      emit(DoctorProfileDatetimeIntervalsError(message: error.toString()));
    }
  }
}
