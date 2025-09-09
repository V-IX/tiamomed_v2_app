import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:provider/provider.dart' as provider;
import 'package:provider/single_child_widget.dart';

import '../data/client_files_repository.dart';
import '../di/client_files_provider.dart';
import '../state/client_files_cubit.dart';
import 'client_file_card.dart';

class ClientFilesPage extends StatefulWidget {
  const ClientFilesPage({super.key});

  @override
  State<ClientFilesPage> createState() => _ClientFilesPageState();
}

class _ClientFilesPageState extends State<ClientFilesPage> {
  int filesChecked = 0;

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: <SingleChildWidget>[clientFilesApiServiceProvider, clientFilesRepositoryProvider],
      child: bloc.BlocProvider<ClientFilesCubit>(
        create: (BuildContext context) {
          return ClientFilesCubit(clientFilesRepository: context.read<ClientFilesRepository>())
            ..getFileNames();
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('Файлы')),
          body: bloc.BlocBuilder<ClientFilesCubit, ClientFilesState>(
            builder: (BuildContext context, ClientFilesState state) {
              return switch (state) {
                ClientFilesInitial() => const Center(child: CircularProgressIndicator()),
                ClientFilesLoading() => const Center(child: CircularProgressIndicator()),
                ClientFilesError() => Center(child: Text(state.message)),
                ClientFilesLoaded() => ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      ClientFileCard(file: state.files[index]),
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemCount: state.files.length,
                ),
              };
            },
          ),
        ),
      ),
    );
  }
}
