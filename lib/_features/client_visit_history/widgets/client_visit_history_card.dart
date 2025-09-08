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
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(data.date, style: Theme.of(context).textTheme.titleLarge),
            Text(
              '+ ${data.bonuses} бонусов',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
