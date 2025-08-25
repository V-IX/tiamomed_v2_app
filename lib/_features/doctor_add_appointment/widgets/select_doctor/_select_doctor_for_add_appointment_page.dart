import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../routes/select_doctor_service_for_add_appointment_route.dart';
import '../../state/doctor_add_appointment/doctor_add_appointment_bloc.dart';
import '../shared/doctor_add_appointment_floating_buttons.dart';
import '../shared/doctor_add_appointment_stage_indicator.dart';
import 'selectable_doctor_list.dart';

class SelectDoctorForAddAppointmentPage extends StatelessWidget {
  const SelectDoctorForAddAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAddAppointmentBloc, DoctorAddAppointmentState>(
      builder: (BuildContext context, DoctorAddAppointmentState doctorAddAppointmentState) {
        return Scaffold(
          appBar: const CustomAppBar(title: 'Запись к врачу'),
          floatingActionButton: DoctorAddAppointmentFloatingButtons(
            onNextTap: doctorAddAppointmentState.selectedDoctor != null ? () {
              context.pushNamed(SelectDoctorServiceForAddAppointmentRoute.name);
            } : null,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: <Widget>[
                  const DoctorAddAppointmentStageIndicator(step: 1),
                  const SizedBox(height: 22),
                  SelectableDoctorList(
                    selectedDoctor: doctorAddAppointmentState.selectedDoctor
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
