import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../data/client_files_repository.dart';
import '../models/client_file.dart';

part 'client_files_state.dart';

class ClientFilesCubit extends Cubit<ClientFilesState> {
  ClientFilesCubit({required ClientFilesRepository clientFilesRepository})
    : _clientFilesRepository = clientFilesRepository,
      super(ClientFilesInitial());

  final ClientFilesRepository _clientFilesRepository;
  final Logger _logger = Logger();

  Future<void> getFileNames() async {
    try {
      emit(ClientFilesLoading());
      final List<ClientFile> files = await _clientFilesRepository.getFileNames();
      emit(ClientFilesLoaded(files: files));
    } catch (e) {
      emit(ClientFilesError(message: e.toString()));
      _logger.e(e);
    }
  }
}
