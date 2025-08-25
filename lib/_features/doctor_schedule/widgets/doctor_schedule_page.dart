import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as provider;

import '../../../_shared/data/doctor/doctor_appointments/doctor_appointments_repository.dart';
import '../../../_shared/di/doctor_appointments_providers.dart';
import '../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../state/doctor_schedule/doctor_schedule_bloc.dart';
import 'doctor_schedule_appointments.dart';
import 'doctor_schedule_calendar_wrapper.dart';

class DoctorSchedulePage extends StatefulWidget {
  const DoctorSchedulePage({super.key});

  @override
  State<DoctorSchedulePage> createState() => _DoctorSchedulePageState();
}

class _DoctorSchedulePageState extends State<DoctorSchedulePage> {
  DateTime _selectedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[
        doctorAppointmentsApiServiceProvider,
        doctorAppointmentsRepositoryProvider,
      ],
      child: bloc.BlocProvider<DoctorScheduleBloc>(
        create: (BuildContext context) {
          return DoctorScheduleBloc(
            appointmentsRepository: context.read<DoctorAppointmentsRepository>(),
          )..add(LoadDoctorScheduleEvent(date: ''));
        },
        child: Scaffold(
          appBar: const CustomAppBar(title:'Календарь'),
          body: Builder(
            builder: (BuildContext context) {
              return Column(
                children: <Widget>[
                  DoctorScheduleCalendarWrapper(
                    selectedDay: _selectedDay,
                    onDaySelected: (DateTime selectedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                      });
                      context.read<DoctorScheduleBloc>().add(LoadDoctorScheduleEvent(date: ''));
                    },
                  ),
                  Expanded(child: DoctorScheduleAppointments(selectedDay: _selectedDay)),
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
