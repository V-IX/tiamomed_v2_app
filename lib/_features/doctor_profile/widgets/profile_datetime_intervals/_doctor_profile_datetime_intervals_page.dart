import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../../../_shared/data/doctor/doctor_info/doctor_repository.dart';
import '../../state/doctor_profile_datetime_intervals/doctor_profile_datetime_intervals_cubit.dart';
import 'doctor_profile_datetime_intervals_list.dart';

class DoctorProfileDateTimeIntervalsPage extends StatelessWidget {
  const DoctorProfileDateTimeIntervalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorProfileDatetimeIntervalsCubit>(
      create: (context) =>
          DoctorProfileDatetimeIntervalsCubit(doctorRepository: context.read<DoctorRepository>())
            ..loadIntervals(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Расписание'),
        body: BlocBuilder<DoctorProfileDatetimeIntervalsCubit, DoctorProfileDatetimeIntervalsState>(
          builder: (context, state) {
            return switch (state) {
              DoctorProfileDatetimeIntervalsInitial() => const Center(
                child: CircularProgressIndicator(),
              ),
              DoctorProfileDatetimeIntervalsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              DoctorProfileDatetimeIntervalsLoaded() => DoctorProfileDatetimeIntervalsList(
                datetimeIntervals: state.intervals,
                months: state.months,
              ),
              DoctorProfileDatetimeIntervalsError() => const Center(child: Text('Ошибка')),
            };
          },
        ),
      ),
    );
  }
}
