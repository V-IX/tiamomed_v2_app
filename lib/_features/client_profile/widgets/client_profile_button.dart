import 'package:flutter/material.dart';

class ClientProfileButton extends StatelessWidget {
  const ClientProfileButton({super.key, required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
        color: Colors.white,
        child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, right: 12, left: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              child,
              const SizedBox(width: 22),
              Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black12,
                child: const Icon(Icons.chevron_right),
              )
            ],
          ),
        ),
      )
    );
  }
}
