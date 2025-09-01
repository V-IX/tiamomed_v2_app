import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as provider;
import 'package:swipe_refresh/swipe_refresh.dart';

import '../../../_shared/data/doctor/doctor_appointments/doctor_appointments_repository.dart';
import '../../../_shared/di/doctor_appointments_providers.dart';
import '../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../../_shared/data/doctor/doctor_info/doctor_repository.dart';
import '../../../_shared/di/doctor_provider.dart';
import '../state/doctor_home_bloc.dart';
import 'doctor_home_loaded_content.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  State<DoctorHomePage> createState() => _DoctorHomePageState();
}

class _DoctorHomePageState extends State<DoctorHomePage> {
  final StreamController<SwipeRefreshState> _swipeStreamController =
      StreamController<SwipeRefreshState>.broadcast();

  @override
  void dispose() {
    _swipeStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[
        doctorApiServiceProvider,
        doctorRepositoryProvider,
        doctorAppointmentsApiServiceProvider,
        doctorAppointmentsRepositoryProvider,
      ],
      child: bloc.BlocProvider<DoctorHomeBloc>(
        create: (BuildContext context) => DoctorHomeBloc(
          doctorAppointmentsRepository: context.read<DoctorAppointmentsRepository>(),
          doctorRepository: context.read<DoctorRepository>(),
        )..add(LoadDoctorHomeEvent()),
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Главная'),
          body: bloc.BlocConsumer<DoctorHomeBloc, DoctorHomeState>(
            listener: (BuildContext context, DoctorHomeState state) {
              _swipeStreamController.sink.add(SwipeRefreshState.hidden);
            },
            builder: (BuildContext context, DoctorHomeState state) {
              return SwipeRefresh.adaptive(
                shrinkWrap: true,
                indicatorColor: Theme.of(context).colorScheme.primary,
                onRefresh: () {
                  context.read<DoctorHomeBloc>().add(LoadDoctorHomeEvent());
                },
                stateStream: _swipeStreamController.stream,
                children: [
                  switch (state) {
                    DoctorHomeInitial() => const Center(child: CircularProgressIndicator()),
                    DoctorHomeLoading() => const Center(child: CircularProgressIndicator()),
                    DoctorHomeLoaded() => DoctorHomeLoadedContent(
                      todayAppointments: state.todayAppointments,
                      doctor: state.doctor,
                    ),
                    DoctorHomeError() => Center(child: Text(state.message)),
                  },
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
