import 'package:flutter/material.dart';

import '../models/client_certificate.dart';
import '../models/client_season_ticket.dart';
import 'client_certificate_card.dart';
import 'client_season_ticket_card.dart';

class ClientSeasonTicketList extends StatelessWidget {
  const ClientSeasonTicketList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(22),
      itemBuilder: (BuildContext context, int index){
        return ClientSeasonTicketCard(
          clientSeasonTicket: ClientSeasonTicket.fake(),
        );
      },
      separatorBuilder: (_, int index) {
        return const SizedBox(height: 12);
      },
      itemCount: 10,
    );
  }
}
