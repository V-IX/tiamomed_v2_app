import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/client_bonuses_api_service.dart';
import '../data/client_bonuses_repository.dart';

final Provider<ClientBonusesApiService> clientBonusesApiServiceProvider =
    Provider<ClientBonusesApiService>(
      create: (BuildContext context) =>
          ClientBonusesApiService(apiClient: context.read<ApiClient>()),
    );

final Provider<ClientBonusesRepository> clientBonusesRepositoryProvider =
    Provider<ClientBonusesRepository>(
      create: (BuildContext context) =>
          ClientBonusesRepository(clientBonusesApiService: context.read<ClientBonusesApiService>()),
    );
