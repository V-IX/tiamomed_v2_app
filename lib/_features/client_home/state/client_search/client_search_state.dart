part of 'client_search_bloc.dart';

@immutable
sealed class ClientSearchState {}

final class ClientSearchInitial extends ClientSearchState {}
final class ClientSearchLoading extends ClientSearchState {}
final class ClientSearchLoaded extends ClientSearchState {
  ClientSearchLoaded({required this.itemsForSearch});

  final List<ClientSearchItem> itemsForSearch;
}
final class ClientSearchError extends ClientSearchState {
  ClientSearchError({required this.message});

  final String message;
}
