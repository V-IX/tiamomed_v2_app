import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/client_search/client_search_api_service.dart';
import '../data/client_search/client_search_repository.dart';

final Provider<ClientSearchApiService> clientSearchApiServiceProvider = Provider<ClientSearchApiService>(
  create: (BuildContext context) => ClientSearchApiService(apiClient: context.read<ApiClient>()),
);

final Provider<ClientSearchRepository> clientSearchRepositoryProvider = Provider<ClientSearchRepository>(
  create: (BuildContext context) => ClientSearchRepository(clientSearchApiService: context.read<ClientSearchApiService>()),
);
