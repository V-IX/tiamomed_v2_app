import 'package:flutter/material.dart';

import 'client_service_promotion_history_card.dart';

class ClientServicePromotionHistoryList extends StatelessWidget {
  const ClientServicePromotionHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, int index) {
                return const ClientServicePromotionHistoryCard();
              },
              separatorBuilder: (_, _) {
                return const SizedBox(height: 12);
              },
              itemCount: 10
            ),
          ),
        ],
      ),
    );
  }

}
