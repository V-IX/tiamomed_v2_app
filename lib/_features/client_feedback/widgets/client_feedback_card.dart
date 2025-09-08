import 'dart:io';

import 'package:flutter/material.dart';

import '../models/client_feedback.dart';

class ClientFeedbackCard extends StatelessWidget {
  const ClientFeedbackCard({super.key, required this.feedback});

  final ClientFeedback feedback;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(feedback.date),
            Row(
              spacing: 4,
              children: <Widget>[
                for (int i = 1; i <= 5; i++)
                  Icon(
                    Icons.star,
                    size: 48,
                    color: i > feedback.rating
                        ? const Color(0xFFEDEDED)
                        : Theme.of(context).colorScheme.primary,
                  ),
              ],
            ),
            Text(feedback.text, maxLines: 3, overflow: TextOverflow.ellipsis),
            Row(
              spacing: 8,
              children: [
                for (int i = 0; i < feedback.imagesUrl.length; i++)
                SizedBox(
                  width: 86,
                  height: 86,
                  child: Image.network(feedback.imagesUrl[i], fit: BoxFit.cover),
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}
