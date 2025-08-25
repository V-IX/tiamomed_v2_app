part of 'client_search_bloc.dart';

sealed class ClientSearchEvent {}

class GetClientSearchItemEvent extends ClientSearchEvent {
  GetClientSearchItemEvent({required this.text});

  final String text;
}
