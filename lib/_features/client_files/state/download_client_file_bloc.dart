import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/client_files_repository.dart';

part 'download_client_file_event.dart';
part 'download_client_file_state.dart';

class DownloadClientFileBloc extends Bloc<DownloadClientFileEvent, DownloadClientFileState> {
  DownloadClientFileBloc({required ClientFilesRepository clientFilesRepository})
    : _clientFilesRepository = clientFilesRepository,
      super(const DownloadClientFileState()) {
    on<StartDownloadClientFileEvent>(_onStartDownloadClientFile);
  }

  final ClientFilesRepository _clientFilesRepository;

  StreamSubscription<Uint8List>? _downloadSubscription;
  File? _outputFile;

  Future<void> _onStartDownloadClientFile(
      StartDownloadClientFileEvent event,
      Emitter<DownloadClientFileState> emit,
      ) async {

    emit(state.copyWith(
        status: DownloadClientFileStatus.loading,
        progress: 0,
        clearErrorMessage: true
    ));

    try {
      final filePath = await _clientFilesRepository.getFile(
        fileName: event.fileName,
        savePath: event.savePath, // Assuming your repo method takes this
        onProgress: (int bytesDownloaded, int totalBytes) {
          if (totalBytes > 0) {

            final int progressPercentage = ((bytesDownloaded / totalBytes) * 100).toInt();
            print(progressPercentage);
            if (state.status == DownloadClientFileStatus.loading) { // Only emit if still loading
              emit(state.copyWith(progress: progressPercentage));
            }
          }
        },
      );
      emit(state.copyWith(status: DownloadClientFileStatus.success, downloadedFilePath: filePath, progress: 100));


    } catch (e) {
      if (state.status == DownloadClientFileStatus.loading) { // Check if not already handled by stream's onError
        emit(state.copyWith(
            status: DownloadClientFileStatus.error, errorMessage: e.toString()));
      }
      _downloadSubscription = null; // Clean up
      _outputFile = null;
    }
  }


  Future<void> _onCancelDownloadClientFileEvent(
      CancelDownloadClientFileEvent event,
      Emitter<DownloadClientFileState> emit,
      ) async {
    if (state.status == DownloadClientFileStatus.loading) {
      await _downloadSubscription?.cancel();
      _downloadSubscription = null;
      // Optionally delete partially downloaded file
      if (_outputFile != null && await _outputFile!.exists()) {
        await _outputFile!.delete().catchError((_){}); // Ignore error on delete
      }
      _outputFile = null;
      emit(state.copyWith(status: DownloadClientFileStatus.initial, progress: 0)); // Or an error/cancelled state
    }
  }

  @override
  Future<void> close() {
    _downloadSubscription?.cancel(); // Ensure subscription is cancelled when BLoC is closed
    // If _outputFile and its sink are open, they should be closed too,
    // but onDone/onError in the stream listener should handle this.
    return super.close();
  }

}
