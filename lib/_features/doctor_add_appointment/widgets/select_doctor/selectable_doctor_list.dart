import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../doctor_profile/data/doctor_repository.dart';
import '../../../doctor_profile/models/doctor.dart';
import '../../state/doctor_add_appointment/doctor_add_appointment_bloc.dart';
import '../../state/doctors_for_add_appointment/doctors_for_add_appointment_cubit.dart';
import 'selectable_doctor_card.dart';

class SelectableDoctorList extends StatelessWidget {
  const SelectableDoctorList({super.key, this.selectedDoctor});

  final Doctor? selectedDoctor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorsForAddAppointmentCubit>(
      create: (BuildContext context) =>
          DoctorsForAddAppointmentCubit(doctorRepository: context.read<DoctorRepository>())
            ..loadDoctors(),
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
                return SelectableDoctorCard(
                  doctor: doctorsState.doctors[index],
                  isSelectedDoctor:
                      selectedDoctor?.id == doctorsState.doctors[index].id,
                  onTap: () {
                    context.read<DoctorAddAppointmentBloc>().add(
                      DoctorAddAppointmentSelectDoctorEvent(
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
