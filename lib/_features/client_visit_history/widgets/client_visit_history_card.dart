import 'package:flutter/material.dart';

import '../models/client_visit.dart';

class ClientVisitHistoryCard extends StatelessWidget {
  const ClientVisitHistoryCard({super.key, required this.data, required this.onTap});

  final ClientVisit data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(22),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data.date),
            Text("+ " + data.bonuses.toString() + " бонусов"),
          ]
        )
      )
    );
  }
}
