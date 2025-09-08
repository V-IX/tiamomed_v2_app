import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/client_notifications_api_service.dart';
import '../data/client_notifications_repository.dart';

final Provider<ClientNotificationsApiService> clientNotificationsApiServiceProvider =
    Provider<ClientNotificationsApiService>(
      create: (BuildContext context) =>
          ClientNotificationsApiService(apiClient: context.read<ApiClient>()),
    );

final Provider<ClientNotificationsRepository> clientNotificationsRepositoryProvider =
    Provider<ClientNotificationsRepository>(
      create: (BuildContext context) => ClientNotificationsRepository(
        clientNotificationsApiService: context.read<ClientNotificationsApiService>(),
      ),
    );
