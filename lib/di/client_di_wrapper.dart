import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart' as provider;

import '../_features/client_notifications/data/client_notifications_repository.dart';
import '../_features/client_notifications/di/client_notifications_provider.dart';
import '../_features/client_notifications/state/client_notifications_bloc.dart';

class ClientDiWrapper extends StatelessWidget {
  const ClientDiWrapper({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        clientNotificationsApiServiceProvider,
        clientNotificationsRepositoryProvider
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ClientNotificationsBloc>(
            create: (BuildContext context) => ClientNotificationsBloc(
              clientNotificationsRepository: context.read<ClientNotificationsRepository>()
            )..add(GetNotificationsEvent()),
          ),
        ],
        child: child,
      ),
    );
  }
}
