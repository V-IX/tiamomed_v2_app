import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/client_files_api_service.dart';
import '../data/client_files_repository.dart';

final Provider<ClientFilesApiService> clientFilesApiServiceProvider =
    Provider<ClientFilesApiService>(
      create: (BuildContext context) => ClientFilesApiService(apiClient: context.read<ApiClient>()),
    );

final Provider<ClientFilesRepository> clientFilesRepositoryProvider =
    Provider<ClientFilesRepository>(
      create: (BuildContext context) =>
          ClientFilesRepository(clientFilesApiService: context.read<ClientFilesApiService>()),
    );
