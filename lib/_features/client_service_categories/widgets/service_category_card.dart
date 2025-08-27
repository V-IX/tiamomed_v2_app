import 'package:flutter/material.dart';

class ServiceCategoryCard extends StatelessWidget {
  const ServiceCategoryCard({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black, width: 1))
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Icon(Icons.shopping_bag_sharp, color: Colors.black45)
              ),
              Flexible(
                flex: 5,
                child: Text(title, textAlign:TextAlign.start)
              ),
              const Flexible(
                child: Icon(Icons.chevron_right, color: Colors.black45)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
