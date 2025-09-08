import 'package:flutter/material.dart';

import '../../../constants/image_paths.dart';

class ClientProfileBannerCard extends StatelessWidget {
  const ClientProfileBannerCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        padding: const EdgeInsets.all(22),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          image: const DecorationImage(
            image: AssetImage(certificateBgImagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 7,
              child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18))
            ),
            const Flexible(
              flex: 4,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
