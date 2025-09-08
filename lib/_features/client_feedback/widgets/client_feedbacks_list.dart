import 'package:flutter/material.dart';

import '../models/client_feedback.dart';
import 'client_feedback_card.dart';

class ClientFeedbacksList extends StatelessWidget {
  const ClientFeedbacksList({super.key, required this.feedbacks});

  final List<ClientFeedback> feedbacks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(22),
      itemBuilder: (_, int index) {
        return ClientFeedbackCard(
          feedback: feedbacks[index]
        );
      },
      separatorBuilder: (_, _) {
        return const SizedBox(height: 12);
      },
      itemCount: feedbacks.length,
    );
  }
}
