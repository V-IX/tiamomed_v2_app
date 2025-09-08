part of 'client_home_bloc.dart';

@immutable
sealed class ClientHomeEvent {}
class LoadClientHomeEvent extends ClientHomeEvent {}