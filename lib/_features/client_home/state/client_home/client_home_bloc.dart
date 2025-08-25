import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

part 'client_home_event.dart';
part 'client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  ClientHomeBloc() : super(ClientHomeInitial()) {
    on<ClientHomeEvent>((ClientHomeEvent event, Emitter<ClientHomeState> emit) {
      // TODO: implement event handler
    });
  }
}
