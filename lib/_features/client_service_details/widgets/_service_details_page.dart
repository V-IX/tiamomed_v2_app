import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:nested/nested.dart';
import 'package:provider/provider.dart' as provider;

import '../data/client_service_details_repository.dart';
import '../di/client_service_details_provider.dart';
import '../state/client_service_details_bloc.dart';
import 'service_details_content.dart';

class ServiceDetailsPage extends StatelessWidget {
  const ServiceDetailsPage({super.key, required this.serviceId});

  final String serviceId;

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[
        clientServiceDetailsApiServiceProvider,
        clientServiceDetailsRepositoryProvider,
      ],
      child: bloc.BlocProvider<ClientServiceDetailsBloc>(
        create: (BuildContext context) => ClientServiceDetailsBloc(
          clientServiceDetailsRepository: context.read<ClientServiceDetailsRepository>(),
        )..add(GetClientServiceDetailsEvent(serviceId: serviceId)),
        child: Scaffold(
          appBar: AppBar(title: const Text('Услуга'), centerTitle: true),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButtonAnimator: FloatingActionButtonAnimator.noAnimation,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: SizedBox(
                width: double.infinity,
                height: 54,
                child: FilledButton(onPressed: () {}, child: const Text('Записаться'))),
          ),
          body: bloc.BlocBuilder<ClientServiceDetailsBloc, ClientServiceDetailsState>(
            builder: (BuildContext context, ClientServiceDetailsState state) {
              return switch (state) {
                ClientServiceDetailsInitial() => const Center(child: CircularProgressIndicator()),
                ClientServiceDetailsLoading() => const Center(child: CircularProgressIndicator()),
                ClientServiceDetailsError() => Center(child: Text(state.message)),
                ClientServiceDetailsLoaded() => const ServiceDetailsContent(),
              };
            },
          ),
        ),
      ),
    );
  }
}
