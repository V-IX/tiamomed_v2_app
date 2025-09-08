import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/api_client/api_client.dart';
import '../data/client_feedback_api_service.dart';
import '../data/client_feedback_repository.dart';

final Provider<ClientFeedbackApiService> clientFeedbackApiServiceProvider = Provider<ClientFeedbackApiService>(
  create: (BuildContext context) => ClientFeedbackApiService(
    apiClient: context.read<ApiClient>(),
  )
);

final Provider<ClientFeedbackRepository> clientFeedbackRepositoryProvider = Provider<ClientFeedbackRepository>(
  create: (BuildContext context) => ClientFeedbackRepository(
    clientFeedbackApiService: context.read<ClientFeedbackApiService>(),
  )
);
