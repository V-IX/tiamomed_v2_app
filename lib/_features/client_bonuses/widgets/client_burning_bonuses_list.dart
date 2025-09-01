import 'package:flutter/material.dart';

import '../models/client_bonuses_history_item.dart';
import 'client_burning_bonuses_card.dart';

class ClientBurningBonusesList extends StatelessWidget {
  const ClientBurningBonusesList({super.key, required this.items});

  final List<ClientBonusesHistoryItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, int index) {
        return ClientBurningBonusesCard(item: items[index]);
      },
      separatorBuilder: (_, _) {
        return const Divider(height: 32);
      },
      itemCount: items.length,
    );
  }
}
