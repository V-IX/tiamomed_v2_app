import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/client_season_ticket.dart';
import '../state/client_season_tiсkets/client_season_tickets_cubit.dart';
import 'client_season_ticket_card.dart';

class ClientSeasonTicketList extends StatelessWidget {
  const ClientSeasonTicketList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientSeasonTicketsCubit, ClientSeasonTicketsState>(
      builder: (BuildContext context, ClientSeasonTicketsState state) {
        return switch (state) {
          ClientSeasonTicketsInitial() => const Center(child: CircularProgressIndicator()),
          ClientSeasonTicketsLoading() => const Center(child: CircularProgressIndicator()),
          ClientSeasonTicketsError() => Center(child: Text(state.message)),
          ClientSeasonTicketsLoaded() => RefreshIndicator(
            onRefresh: () async {
              context.read<ClientSeasonTicketsCubit>().getSeasonTickets();
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(22),
              itemBuilder: (BuildContext context, int index) {
                return ClientSeasonTicketCard(clientSeasonTicket: state.tickets[index]);
              },
              separatorBuilder: (_, int index) {
                return const SizedBox(height: 12);
              },
              itemCount: state.tickets.length,
            ),
          ),
        };
      },
    );
  }
}
