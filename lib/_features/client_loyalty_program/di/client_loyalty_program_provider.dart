import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/client_loyalty_program_api_service.dart';
import '../data/client_loyalty_program_repository.dart';

final Provider<ClientLoyaltyProgramApiService> clientLoyaltyProgramApiServiceProvider = Provider<ClientLoyaltyProgramApiService>(
  create: (BuildContext context) => ClientLoyaltyProgramApiService(
    apiClient: context.read(),
  )
);

final Provider<ClientLoyaltyProgramRepository> clientLoyaltyProgramRepositoryProvider = Provider<ClientLoyaltyProgramRepository>(
  create: (BuildContext context) => ClientLoyaltyProgramRepository(
    clientLoyaltyProgramApiService: context.read(),
  )
);
