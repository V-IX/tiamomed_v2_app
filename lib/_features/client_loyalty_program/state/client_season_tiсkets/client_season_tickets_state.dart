part of 'client_season_tickets_cubit.dart';

@immutable
sealed class ClientSeasonTicketsState {}

final class ClientSeasonTicketsInitial extends ClientSeasonTicketsState {}

final class ClientSeasonTicketsLoading extends ClientSeasonTicketsState {}

final class ClientSeasonTicketsLoaded extends ClientSeasonTicketsState {
  ClientSeasonTicketsLoaded({required this.tickets});

  final List<ClientSeasonTicket> tickets;
}

final class ClientSeasonTicketsError extends ClientSeasonTicketsState {
  ClientSeasonTicketsError({required this.message});

  final String message;
}