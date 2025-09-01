part of 'client_bonuses_bloc.dart';

@immutable
sealed class ClientBonusesEvent {}

class GetClientBonusesHistoryEvent extends ClientBonusesEvent {}
