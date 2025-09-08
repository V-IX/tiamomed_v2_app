import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:nested/nested.dart';
import 'package:provider/provider.dart';

import '../../_features/auth/di/auth_provider.dart';
import '../../constants/urls.dart';
import '../_features/auth/state/auth_bloc.dart';
import '../_shared/data/secure_storage/secure_storage_service.dart';
import '../utils/api_client/api_client.dart';


class AppProviderWrapper extends StatelessWidget {
  const AppProviderWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final String login = dotenv.get('API_LOGIN');
    final String password = dotenv.get('API_PASSWORD');

    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<SecureStorageService>(
          create: (BuildContext context) => SecureStorageService(),
        ),
        Provider<ApiClient>(
          create: (BuildContext context) => ApiClient(
            baseUrl: BASE_URL,
            headers: <String, String>{
              'Login': login,
              'Password': password
            },
            flutterSecureStorage: context.read(),
            logOutCallback:() => context.read<AuthBloc>().add(LogOutEvent()),
          )
        ),
        authApiServiceProvider,
        authRepositoryProvider,
      ],
      child: child,
    );
  }
}
