part of 'client_home_bloc.dart';

@immutable
sealed class ClientHomeState {}

final class ClientHomeInitial extends ClientHomeState {}

final class ClientHomeLoading extends ClientHomeState {}

final class ClientHomeLoaded extends ClientHomeState {
  ClientHomeLoaded({required this.categories, required this.bonusesCount});

  final List<ClientServiceCategory> categories;
  final double bonusesCount;
}

final class ClientHomeError extends ClientHomeState {
  ClientHomeError({required this.message});

  final String message;
}
