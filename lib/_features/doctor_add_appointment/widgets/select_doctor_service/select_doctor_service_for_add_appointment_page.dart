import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../routes/select_doctor_time_interval_for_add_appointment_route.dart';
import '../../state/doctor_add_appointment/doctor_add_appointment_bloc.dart';
import '../shared/doctor_add_appointment_floating_buttons.dart';
import '../shared/doctor_add_appointment_stage_indicator.dart';
import 'empty_selected_doctor_services_card.dart';
import 'selected_doctor_services_list.dart';

class SelectDoctorServiceForAddAppointmentPage extends StatelessWidget {
  const SelectDoctorServiceForAddAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorAddAppointmentBloc, DoctorAddAppointmentState>(
      builder: (BuildContext context, DoctorAddAppointmentState doctorAddAppointmentState) {
        return Scaffold(
          appBar: const CustomAppBar(title: 'Запись к врачу'),
          floatingActionButton: DoctorAddAppointmentFloatingButtons(
            onNextTap: doctorAddAppointmentState.selectedDoctor != null ? () {
              context.pushNamed(SelectDoctorTimeIntervalForAddAppointmentRoute.name);
            } : null,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const DoctorAddAppointmentStageIndicator(step: 2),
                  const SizedBox(height: 22.0),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: FilledButton(
                        child: const Text('Добавить услугу'),
                        onPressed: (){
                          //context.go(AppRouter.selectUslugaCategory.routerPath);
                        }
                    ),
                  ),
                  const SizedBox(height: 22.0),
                  const Text(
                    'Выбранные услуги',
                    style: TextStyle(
                      color: Color(0xFF7C8085),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),

                  const SizedBox(height: 22.0),

                  if(doctorAddAppointmentState.selectedServices.isEmpty)
                    const EmptySelectedDoctorServicesCard()
                  else
                    SelectedDoctorServicesList(selectedServices: doctorAddAppointmentState.selectedServices),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
