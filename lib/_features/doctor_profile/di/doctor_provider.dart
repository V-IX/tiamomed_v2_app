import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/doctor_api_service.dart';
import '../data/doctor_repository.dart';

final Provider<DoctorApiService> doctorApiServiceProvider = Provider<DoctorApiService>(
  create: (BuildContext context) => DoctorApiService(apiClient: context.read<ApiClient>()),
);

final Provider<DoctorRepository> doctorRepositoryProvider = Provider<DoctorRepository>(
  create: (BuildContext context) => DoctorRepository(doctorApiService: context.read<DoctorApiService>()),
);
