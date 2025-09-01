import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/data/doctor/doctor_info/doctor_repository.dart';
import '../../../../_shared/models/doctor/doctor.dart';
import '../../../../_shared/state/doctors_for_add_appointment/doctors_for_add_appointment_cubit.dart';
import '../../di/client_add_appointment_di_wrapper.dart';
import '../../state/client_add_appointment/client_add_appointment_bloc.dart';
import 'client_selectable_doctor_card.dart';

class ClientSelectableDoctorList extends StatelessWidget {
  const ClientSelectableDoctorList({super.key, this.selectedDoctor});

  final Doctor? selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorsForAddAppointmentCubit>(
      create: (BuildContext context) =>
          DoctorsForAddAppointmentCubit(doctorRepository: context.read<DoctorRepository>())
            ..loadDoctors('asd'),
      child: BlocBuilder<DoctorsForAddAppointmentCubit, DoctorsForAddAppointmentState>(
        builder: (BuildContext context, DoctorsForAddAppointmentState doctorsState) {
          return switch (doctorsState) {
            DoctorsForAddAppointmentInitial() => const CircularProgressIndicator(),
            DoctorsForAddAppointmentLoading() => const CircularProgressIndicator(),
            DoctorsForAddAppointmentError() => Text(doctorsState.message),
            DoctorsForAddAppointmentLoaded() => ListView.separated(
              clipBehavior: Clip.none,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return ClientSelectableDoctorCard(
                  doctor: doctorsState.doctors[index],
                  isSelectedDoctor:
                      selectedDoctor?.id == doctorsState.doctors[index].id,
                  onTap: () {
                    context.read<ClientAddAppointmentBloc>().add(
                      ClientAddAppointmentSelectDoctorEvent(
                        doctor: doctorsState.doctors[index],
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
              itemCount: doctorsState.doctors.length,
            ),
          };
        },
      ),
    );
  }
}
