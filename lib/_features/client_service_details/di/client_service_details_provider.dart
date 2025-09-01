import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/client_service_details_api_service.dart';
import '../data/client_service_details_repository.dart';

final Provider<ClientServiceDetailsApiService> clientServiceDetailsApiServiceProvider =
    Provider<ClientServiceDetailsApiService>(
      create: (BuildContext context) =>
          ClientServiceDetailsApiService(apiClient: context.read<ApiClient>()),
    );

final Provider<ClientServiceDetailsRepository> clientServiceDetailsRepositoryProvider =
    Provider<ClientServiceDetailsRepository>(
      create: (BuildContext context) => ClientServiceDetailsRepository(
        clientServiceDetailsApiService: context.read<ClientServiceDetailsApiService>(),
      ),
    );
