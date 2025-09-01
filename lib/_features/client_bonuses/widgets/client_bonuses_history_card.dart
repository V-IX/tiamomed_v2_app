import 'package:flutter/material.dart';

import '../models/client_bonuses_history_item.dart';

class ClientBonusesHistoryCard extends StatelessWidget {
  const ClientBonusesHistoryCard({super.key, required this.item});

  final ClientBonusesHistoryItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title,
              style: TextStyle(color: item.type == BonusesType.burned ? Colors.red : Colors.black),
            ),
            const SizedBox(height: 6),
            Text(item.date),
          ],
        ),
        const SizedBox(width: 10),
        Text(
          "${item.type == BonusesType.accrual ? "+" : "-"}${item.count}",
          style: TextStyle(color: item.type == BonusesType.accrual ? Colors.green : Colors.red),
        ),
      ],
    );
  }
}
