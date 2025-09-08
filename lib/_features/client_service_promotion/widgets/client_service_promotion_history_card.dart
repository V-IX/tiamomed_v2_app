import 'package:flutter/material.dart';

import '../../../_shared/widgets/dash_line.dart';

class ClientServicePromotionHistoryCard extends StatelessWidget {
  const ClientServicePromotionHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text('Дата отправки: 14.04.2025'),
                    SizedBox(width: 12),
                    Text('Оплачено')
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: const Text('+23 бонуса')
                ),
                const Text('Иванов Илья Иванович'),
                const Text('+375 33 876-98-96'),
              ],
            ),
          ),
          const DashLine(),
          const Padding(
            padding: EdgeInsets.all(22.0),
            child: Text('Услуга: Motus (размер S,M,L,XL) Бикини Мужское'),
          )
        ],
      ),
    );
  }
}
