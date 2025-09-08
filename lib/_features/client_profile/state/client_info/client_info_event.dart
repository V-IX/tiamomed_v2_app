part of 'client_info_bloc.dart';

@immutable
sealed class ClientInfoEvent {}

class GetClientInfoEvent extends ClientInfoEvent {}

class UpdateClientInfoEvent extends ClientInfoEvent {
  UpdateClientInfoEvent({ required this.clientInfo });

  final ClientInfo clientInfo;
}
