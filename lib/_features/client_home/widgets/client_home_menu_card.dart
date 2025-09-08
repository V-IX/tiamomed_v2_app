import 'package:flutter/material.dart';

class ClientHomeMenuCard extends StatelessWidget {
  const ClientHomeMenuCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.imagePath,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(22),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 64,
              height: 64,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
            Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            Text(subtitle, style: TextStyle(fontSize: 11, overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }
}
