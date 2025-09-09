part of 'download_client_file_bloc.dart';

enum DownloadClientFileStatus { initial, loading, success, error }

@immutable
class DownloadClientFileState {
  const DownloadClientFileState({
    this.status = DownloadClientFileStatus.initial,
    this.progress = 0,
    this.downloadedFilePath,
    this.errorMessage,
  });

  final DownloadClientFileStatus status;
  final int progress;
  final String? downloadedFilePath;
  final String? errorMessage;

  DownloadClientFileState copyWith({
    DownloadClientFileStatus? status,
    int? progress,
    String? downloadedFilePath,
    String? errorMessage,
    bool  clearErrorMessage = false,
  }) {
    return DownloadClientFileState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
      downloadedFilePath: downloadedFilePath ?? this.downloadedFilePath,
      errorMessage: clearErrorMessage ? null : errorMessage ?? this.errorMessage,
    );
  }
}