part of 'client_bonuses_bloc.dart';

@immutable
sealed class ClientBonusesState {}

final class ClientBonusesInitial extends ClientBonusesState {}
final class ClientBonusesLoading extends ClientBonusesState {}
final class ClientBonusesLoaded extends ClientBonusesState {
  ClientBonusesLoaded({required this.history, required this.burningBonuses});

  final ClientBonusesHistory history;
  final List<ClientBonusesHistoryItem> burningBonuses;
}

final class ClientBonusesError extends ClientBonusesState {
  ClientBonusesError({required this.message});

  final String message;
}
