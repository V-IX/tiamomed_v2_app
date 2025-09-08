import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:provider/provider.dart' as provider;

import '../../../_shared/widgets/navigation/custom_app_bar.dart';
import '../data/client_info_repository.dart';
import '../di/client_info_provider.dart';
import '../models/client_info.dart';
import '../state/client_info/client_info_bloc.dart';

class ClientPersonalDataPage extends StatefulWidget {
  const ClientPersonalDataPage({super.key});

  @override
  State<ClientPersonalDataPage> createState() => _ClientPersonalDataPageState();
}

class _ClientPersonalDataPageState extends State<ClientPersonalDataPage> {
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _registrationAddressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _instagramController = TextEditingController();
  final TextEditingController _citizenshipController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [clientInfoApiServiceProvider, clientInfoRepositoryProvider],
      child: bloc.BlocProvider(
        create: (BuildContext context) {
          return ClientInfoBloc(clientInfoRepository: context.read<ClientInfoRepository>())
            ..add(GetClientInfoEvent());
        },

        child: Scaffold(
          appBar: CustomAppBar(title: 'Персональные данные'),
          body: bloc.BlocConsumer<ClientInfoBloc, ClientInfoState>(
            listener: (BuildContext context, ClientInfoState state) {
              if (state is ClientInfoLoaded) {
                _surnameController.text = state.clientInfo.surname;
                _citizenshipController.text = state.clientInfo.citizenship;
                _registrationAddressController.text = state.clientInfo.registrationAddress;
                _emailController.text = state.clientInfo.email;
                _instagramController.text = state.clientInfo.instagram;
              }
            },
            builder: (BuildContext context, ClientInfoState state) {
              return switch (state) {
                ClientInfoInitial() => const Center(child: CircularProgressIndicator()),
                ClientInfoLoading() => const Center(child: CircularProgressIndicator()),
                ClientInfoError() => Center(child: Text(state.message)),
                ClientInfoLoaded() => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Form(
                      child: Column(
                        spacing: 10,
                        children: [
                          const SizedBox(height: 12),

                          TextFormField(
                            controller: _surnameController,
                            decoration: const InputDecoration(hintText: 'Фамилия'),
                          ),

                          TextFormField(
                            controller: _citizenshipController,
                            decoration: const InputDecoration(hintText: 'Гражданство'),
                          ),

                          TextFormField(
                            controller: _registrationAddressController,
                            decoration: const InputDecoration(hintText: 'Адрес регистрации'),
                          ),

                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(hintText: 'Email'),
                          ),

                          TextFormField(
                            controller: _instagramController,
                            decoration: const InputDecoration(hintText: 'Instagram'),
                          ),

                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: FilledButton(
                              onPressed: () {
                                context.read<ClientInfoBloc>().add(
                                  UpdateClientInfoEvent(
                                    clientInfo: ClientInfo(
                                      surname: _surnameController.text,
                                      registrationAddress: _registrationAddressController.text,
                                      citizenship: _citizenshipController.text,
                                      email: _emailController.text,
                                      instagram: _instagramController.text,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Сохранить'),
                            ),
                          ),
                        ],
                      ),
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
