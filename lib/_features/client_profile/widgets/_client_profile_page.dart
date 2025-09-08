import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../auth/state/auth_bloc.dart';
import '../../client_notifications/routes/client_notifications_route.dart';
import '../../client_notifications/state/client_notifications_bloc.dart';
import '../routes/client_personal_data_route.dart';
import 'client_profile_banner_card.dart';
import 'client_profile_button.dart';

class ClientProfilePage extends StatelessWidget {
  const ClientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: MediaQuery.of(context).padding,
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  'Морозов Евгений Викторович',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text('Пациент', style: Theme.of(context).textTheme.titleLarge),
              ),
              const SizedBox(height: 22),
              const ClientProfileBannerCard(
                title: 'Заполните все данные и получите разовую скидку 10%',
              ),
              const SizedBox(height: 22),
              BlocBuilder<ClientNotificationsBloc, ClientNotificationsState>(
                builder: (context, state) {
                  return ClientProfileButton(
                    child: Row(
                      children: [
                        const Text('Уведомления'),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: const Text('22', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                    onTap: () {
                      context.pushNamed(ClientNotificationsRoute.name);
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              ClientProfileButton(
                child: const Text('Персональные данные'),
                onTap: () {
                  context.goNamed(ClientPersonalDataRoute.name);
                },
              ),
              const SizedBox(height: 12),
              ClientProfileButton(child: const Text('Задать вопрос'), onTap: () {}),
              const SizedBox(height: 12),
              ClientProfileButton(child: const Text('Политика конфиденциальности'), onTap: () {}),
              const SizedBox(height: 12),
              ClientProfileButton(child: const Text('Выйти'), onTap: () {context.read<AuthBloc>().add(LogOutEvent());}),

            ],
          ),
        ),
      ),
    );
  }
}
