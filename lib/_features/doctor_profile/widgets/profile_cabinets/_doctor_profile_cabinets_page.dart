import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../../../../_shared/data/doctor/doctor_info/doctor_repository.dart';
import '../../state/doctor_profile_cabinets/doctor_profile_cabinets_cubit.dart';
import 'doctor_profile_cabinets_list.dart';

class DoctorProfileCabinetsPage extends StatelessWidget {
  const DoctorProfileCabinetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorProfileCabinetsCubit>(
      create: (BuildContext context) =>
        DoctorProfileCabinetsCubit(doctorRepository: context.read<DoctorRepository>())
          ..loadCabinets(),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Кабинеты'),
        body: BlocBuilder<DoctorProfileCabinetsCubit, DoctorProfileCabinetsState>(
          builder: (BuildContext context, DoctorProfileCabinetsState state) {
            return switch(state) {
              DoctorProfileCabinetsInitial() => const Center(child: CircularProgressIndicator()),
              DoctorProfileCabinetsLoading() => const Center(child: CircularProgressIndicator()),
              DoctorProfileCabinetsLoaded() => DoctorProfileCabinetsList(cabinets: state.cabinets),
              DoctorProfileCabinetsError(message: final String message) => Center(child: Text(message)),
            };
          }
        ),
      ),
    );
  }
}
