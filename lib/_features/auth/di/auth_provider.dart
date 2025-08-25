import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../../_features/auth/data/auth_api_service.dart';
import '../../../../_features/auth/data/auth_repository.dart';

final Provider<AuthApiService> authApiServiceProvider = Provider<AuthApiService>(
  create: (BuildContext context) => AuthApiService(apiClient: context.read()),
);

final Provider<AuthRepository> authRepositoryProvider = Provider<AuthRepository>(
  create: (BuildContext context) =>
    AuthRepository(
      authApiService: context.read(),
    ),
);
