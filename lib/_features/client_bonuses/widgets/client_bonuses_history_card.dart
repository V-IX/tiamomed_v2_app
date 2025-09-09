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
              item.text,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 6),
            Text(item.date),
          ],
        ),
        const SizedBox(width: 10),
        Text(
          "${item.count > 0 ? "+" : ""}${item.count}",
          style: TextStyle(color: item.count > 0 ? Colors.green : Colors.red),
        ),
      ],
    );
  }
}
