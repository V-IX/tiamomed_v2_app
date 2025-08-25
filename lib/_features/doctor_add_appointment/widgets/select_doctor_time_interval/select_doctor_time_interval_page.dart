import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../state/doctor_add_appointment/doctor_add_appointment_bloc.dart';
import '../shared/doctor_add_appointment_floating_buttons.dart';
import '../shared/doctor_add_appointment_stage_indicator.dart';

class SelectDoctorTimeIntervalPage extends StatelessWidget {
  const SelectDoctorTimeIntervalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAddAppointmentBloc, DoctorAddAppointmentState>(
      builder: (context, doctorAddAppointmentState) {
        return Scaffold(
          appBar: CustomAppBar(title: "Запись к врачу"),
          floatingActionButton: DoctorAddAppointmentFloatingButtons(
            onNextTap: doctorAddAppointmentState.selectedDoctor != null ? () {
              context.pushNamed('select_doctor_service_for_add_appointment');
            } : null,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(22.0),
              child: Column(

                children: [
                  DoctorAddAppointmentStageIndicator(step: 3),
                  SizedBox(height: 22),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
