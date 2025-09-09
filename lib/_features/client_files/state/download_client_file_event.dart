part of 'download_client_file_bloc.dart';

@immutable
sealed class DownloadClientFileEvent {}


class StartDownloadClientFileEvent extends DownloadClientFileEvent {
  StartDownloadClientFileEvent({required this.fileName, required this.savePath});

  final String fileName;
  final String savePath;
}

class CancelDownloadClientFileEvent extends DownloadClientFileEvent {}