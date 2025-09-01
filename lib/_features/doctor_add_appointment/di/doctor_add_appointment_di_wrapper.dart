import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as provider;

import '../../../_shared/di/doctor_appointments_providers.dart';
import '../../../_shared/di/doctor_provider.dart';
import '../state/doctor_add_appointment/doctor_add_appointment_bloc.dart';

class DoctorAddAppointmentDiWrapper extends StatelessWidget {
  const DoctorAddAppointmentDiWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[
        doctorApiServiceProvider,
        doctorRepositoryProvider,
        doctorAppointmentsApiServiceProvider,
        doctorAppointmentsRepositoryProvider,
      ],
      child: bloc.BlocProvider<DoctorAddAppointmentBloc>(
        create: (BuildContext context) => DoctorAddAppointmentBloc(),
        child: child,
      )
    );
  }
}
