import '../models/client_file.dart';
import 'client_files_api_service.dart';

class ClientFilesRepository {
  ClientFilesRepository({required ClientFilesApiService clientFilesApiService})
    : _clientFilesApiService = clientFilesApiService;

  final ClientFilesApiService _clientFilesApiService;

  Future<List<ClientFile>> getFileNames() {
    return _clientFilesApiService.getFileNames();
  }

  Future<String> getFile({
    required String fileName,
    required String savePath,
    required Function(int progress, int total) onProgress,
  }) {
    return _clientFilesApiService.getFile(
      fileName: fileName,
      savePath: savePath,
      onProgress: onProgress,
    );
  }
}
