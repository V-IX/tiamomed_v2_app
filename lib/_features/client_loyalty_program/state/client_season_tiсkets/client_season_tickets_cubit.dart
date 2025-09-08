import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/client_loyalty_program_repository.dart';
import '../../models/client_season_ticket.dart';

part 'client_season_tickets_state.dart';

class ClientSeasonTicketsCubit extends Cubit<ClientSeasonTicketsState> {
  ClientSeasonTicketsCubit({required ClientLoyaltyProgramRepository clientLoyaltyProgramRepository})
    : _clientLoyaltyProgramRepository = clientLoyaltyProgramRepository,
      super(ClientSeasonTicketsInitial());

  final ClientLoyaltyProgramRepository _clientLoyaltyProgramRepository;

  Future<void> getSeasonTickets() async {
    try {
      emit(ClientSeasonTicketsLoading());
      final List<ClientSeasonTicket> tickets = await _clientLoyaltyProgramRepository.getSeasonTickets();
      emit(ClientSeasonTicketsLoaded(tickets: tickets));
    } catch (e) {
      emit(ClientSeasonTicketsError(message: e.toString()));
    }
  }
}
