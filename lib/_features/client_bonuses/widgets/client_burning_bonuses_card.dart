import 'package:flutter/material.dart';

import '../models/client_bonuses_history_item.dart';

class ClientBurningBonusesCard extends StatelessWidget {
  const ClientBurningBonusesCard({super.key, required this.item});

  final ClientBonusesHistoryItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item.date),
        const SizedBox(width: 10),
        Text('-${item.count}')
      ]
    );
  }
}
