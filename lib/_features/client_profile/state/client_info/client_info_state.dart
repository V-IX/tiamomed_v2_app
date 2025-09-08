part of 'client_info_bloc.dart';

@immutable
sealed class ClientInfoState {}

final class ClientInfoInitial extends ClientInfoState {}

final class ClientInfoLoading extends ClientInfoState {}

final class ClientInfoLoaded extends ClientInfoState {
  ClientInfoLoaded({required this.clientInfo});

  final ClientInfo clientInfo;
}

final class ClientInfoError extends ClientInfoState {
  ClientInfoError(this.message);

  final String message;
}
