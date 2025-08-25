import 'package:flutter/material.dart';

class ClientHomeMenuCard extends StatelessWidget {
  const ClientHomeMenuCard({super.key, required this.title, required this.subtitle, required this.onTap});

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  //final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(16)),
        child: Column(
          spacing: 6,
          children: <Widget>[
            const Icon(Icons.image),
            Text(title),
            Text(subtitle),
          ],
        ),
      ),
    );
  }

}
