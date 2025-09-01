part of 'client_service_details_bloc.dart';

@immutable
sealed class ClientServiceDetailsEvent {}

class GetClientServiceDetailsEvent extends ClientServiceDetailsEvent {
  GetClientServiceDetailsEvent({required this.serviceId});

  final String serviceId;
}
