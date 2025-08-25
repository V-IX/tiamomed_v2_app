import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/api_client/api_client.dart';
import '../data/doctor/doctor_appointments/doctor_appointments_api_service.dart';
import '../data/doctor/doctor_appointments/doctor_appointments_repository.dart';

final Provider<DoctorAppointmentsApiService> doctorAppointmentsApiServiceProvider = Provider<DoctorAppointmentsApiService>(
  create: (BuildContext context) => DoctorAppointmentsApiService(apiClient: context.read<ApiClient>())
);

final Provider<DoctorAppointmentsRepository> doctorAppointmentsRepositoryProvider = Provider<DoctorAppointmentsRepository>(
  create: (BuildContext context) => DoctorAppointmentsRepository(doctorAppointmentsApiService: context.read<DoctorAppointmentsApiService>()),
);
