import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:provider/provider.dart' as provider;
import 'package:provider/single_child_widget.dart';

import '../../../_shared/di/doctor_appointments_providers.dart';
import '../../../_shared/di/doctor_provider.dart';
import '../state/client_add_appointment/client_add_appointment_bloc.dart';

class ClientAddAppointmentDiWrapper extends StatelessWidget {
  const ClientAddAppointmentDiWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
        providers: <SingleChildWidget>[
          doctorApiServiceProvider,
          doctorRepositoryProvider,
        ],
        child: bloc.BlocProvider<ClientAddAppointmentBloc>(
          create: (BuildContext context) => ClientAddAppointmentBloc(),
          child: child,
        )
    );
  }
}
