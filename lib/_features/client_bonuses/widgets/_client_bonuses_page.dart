import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as provider;

import '../data/client_bonuses_repository.dart';
import '../di/client_bonuses_provider.dart';
import '../state/client_bonuses_bloc.dart';
import 'client_bonuses_card.dart';
import 'client_bonuses_history_list.dart';
import 'client_burning_bonuses_list.dart';

class ClientBonusesPage extends StatelessWidget {
  const ClientBonusesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[clientBonusesApiServiceProvider, clientBonusesRepositoryProvider],
      child: bloc.BlocProvider<ClientBonusesBloc>(
        create: (BuildContext context) =>
            ClientBonusesBloc(clientBonusesRepository: context.read<ClientBonusesRepository>())
              ..add(GetClientBonusesHistoryEvent()),
        child: Scaffold(
          appBar: AppBar(title: const Text('Бонусные баллы')),
          body: bloc.BlocBuilder<ClientBonusesBloc, ClientBonusesState>(
            builder: (BuildContext context, ClientBonusesState state) {
              return switch (state) {
                ClientBonusesInitial() => const Center(child: CircularProgressIndicator()),
                ClientBonusesLoading() => const Center(child: CircularProgressIndicator()),
                ClientBonusesError() => Center(child: Text(state.message)),
                ClientBonusesLoaded() => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const ClientBonusesCard(count: 120),
                        const SizedBox(height: 22),
                        const Text('Сгорания баллов'),
                        const SizedBox(height: 22),
                        ClientBurningBonusesList(items: state.burningBonuses),
                        const SizedBox(height: 22),
                        const Text('История начислений и списаний'),
                        const SizedBox(height: 22),
                        ClientBonusesHistoryList(items: state.history.history)
                      ],
                    ),
                  ),
                ),
              };
            },
          ),
        ),
      ),
    );
  }
}
