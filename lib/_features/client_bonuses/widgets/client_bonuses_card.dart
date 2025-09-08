import 'package:flutter/material.dart';

class ClientBonusesCard extends StatelessWidget {
  const ClientBonusesCard({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Row(
              spacing: 12,
              children: [
                Text(count.toString(), style:
                const TextStyle(
                    fontSize: 48,
                    color: Colors.white
                )),
                const Text('баллов',
                    style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
            const Text('Копите баллы и оплачивайте ими: УЗИ, анализы, консультации и многое другое',style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
