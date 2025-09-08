import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/client_services_api_service.dart';
import '../data/client_services_repository.dart';

final Provider<ClientServicesApiService> clientServicesApiServiceProvider = Provider<ClientServicesApiService>(
  create: (BuildContext context) => ClientServicesApiService(apiClient: context.read<ApiClient>())
);

final Provider<ClientServicesRepository> clientServicesRepositoryProvider = Provider<ClientServicesRepository>(
  create: (BuildContext context) => ClientServicesRepository(clientServicesApiService: context.read<ClientServicesApiService>()),
);
