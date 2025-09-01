part of 'client_service_details_bloc.dart';

@immutable
sealed class ClientServiceDetailsState {}

final class ClientServiceDetailsInitial extends ClientServiceDetailsState {}
final class ClientServiceDetailsLoading extends ClientServiceDetailsState {}
final class ClientServiceDetailsLoaded extends ClientServiceDetailsState {}
final class ClientServiceDetailsError extends ClientServiceDetailsState {
  ClientServiceDetailsError({required this.message});

  final String message;
}
