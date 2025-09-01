import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../state/client_add_appointment/client_add_appointment_bloc.dart';
import '../shared/client_add_appointment_stage_indicator.dart';
import 'client_selectable_doctor_list.dart';

class ClientSelectDoctorForAddAppointmentPage extends StatelessWidget {
  const ClientSelectDoctorForAddAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientAddAppointmentBloc, ClientAddAppointmentState>(
      builder: (BuildContext context, ClientAddAppointmentState state) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Запись на прием',
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(22),
              child: Column(
                children: <Widget>[
                  ClientAddAppointmentStageIndicator(
                      step: 1, isShowServices: false),
                  SizedBox(height: 22),
                  ClientSelectableDoctorList(selectedDoctor: state.selectedDoctor),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
