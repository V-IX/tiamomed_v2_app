import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../_shared/data/doctor/doctor_info/doctor_repository.dart';
import '../../state/doctor_profile_services/doctor_profile_services_cubit.dart';

class ProfileDoctorServiceTypesPage extends StatelessWidget {
  const ProfileDoctorServiceTypesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DoctorProfileServicesCubit>(
      create: (BuildContext context) => DoctorProfileServicesCubit(doctorRepository: context.read<DoctorRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Услуги'),
        ),
        body: const Center(child: Text('Услуги')),
      ),
    );
  }
}
