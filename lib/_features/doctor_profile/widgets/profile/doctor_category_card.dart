import 'package:flutter/material.dart';

class DoctorCategoryCard extends StatelessWidget {
  const DoctorCategoryCard({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius:  BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 16,
            ),
          ],
          color: Colors.white
        ),
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/wave_bg.png', fit: BoxFit.cover),
            Positioned(
              left: 14,
              bottom: 14,
              child: Text(title, style: const TextStyle(fontSize: 16))
            )
          ],
        ),
      )
    );
  }
}
