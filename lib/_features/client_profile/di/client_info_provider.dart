import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/client_info_api_service.dart';
import '../data/client_info_repository.dart';

final Provider<ClientInfoApiService> clientInfoApiServiceProvider = Provider<ClientInfoApiService>(
  create: (BuildContext context) => ClientInfoApiService(apiClient: context.read<ApiClient>()),
);

final Provider<ClientInfoRepository> clientInfoRepositoryProvider = Provider<ClientInfoRepository>(
  create: (BuildContext context) =>
    ClientInfoRepository(clientInfoApiService: context.read<ClientInfoApiService>()),
);
