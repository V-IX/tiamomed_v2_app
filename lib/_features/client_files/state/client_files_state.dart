part of 'client_files_cubit.dart';

@immutable
sealed class ClientFilesState {}

final class ClientFilesInitial extends ClientFilesState {}

final class ClientFilesLoading extends ClientFilesState {}

final class ClientFilesLoaded extends ClientFilesState {
  ClientFilesLoaded({required this.files});

  final List<ClientFile> files;
}

final class ClientFilesError extends ClientFilesState {
  ClientFilesError({required this.message});

  final String message;
}
