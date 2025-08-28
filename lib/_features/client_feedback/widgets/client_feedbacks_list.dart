import 'package:flutter/material.dart';

import '../models/client_feedback.dart';
import 'client_feedback_card.dart';

class ClientFeedbacksList extends StatelessWidget {
  const ClientFeedbacksList({super.key, required this.feedbacks});

  final List<String> feedbacks;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(22),
      itemBuilder: (_, int index) {
        return ClientFeedbackCard(
          feedback: ClientFeedback(
            id: 'feedback_id_${index + 1}',
            date: DateTime.now().subtract(Duration(days: index * 5)).toIso8601String(),
            rating: (index % 5) + 1,
            text:
                'This is some wonderfully elaborate and exceptionally detailed feedback for item number ${index + 1}. The user has taken a considerable amount of time to articulate their thoughts with great precision and clarity.  They mentioned that the product exceeded their expectations in several key areas, particularly highlighting the innovative design and the user-friendly interface.  Furthermore, the customer service experience was reported as being top-notch, with prompt and helpful responses to all inquiries.  The overall sentiment is overwhelmingly positive, suggesting a high level of satisfaction.  It is worth noting that the user also provided some constructive criticism regarding a minor feature, which they believe could be further improved in future iterations.  They suggested that perhaps adding a dark mode option would enhance the user experience, especially for those who prefer to use the application in low-light environments.  Additionally, they expressed a desire for more customization options, allowing for a more personalized interaction with the product.  The length of this feedback is intentionally verbose to simulate a real-world scenario where users provide extensive commentary.  This allows for thorough testing of the UI elements responsible for displaying such feedback, ensuring that even lengthy texts are handled gracefully without any layout issues or truncation problems.  The inclusion of varied ratings and dates also contributes to a more realistic and diverse dataset for development and testing purposes.  Finally, this extensive feedback underscores the importance of capturing and analyzing user input to drive product improvements and maintain a high level of customer satisfaction.  The user also mentioned that they would definitely recommend this product to their friends and colleagues, which is a strong indicator of its quality and appeal.',
            imagesUrl: [
              'https://via.placeholder.com/150/FF0000/FFFFFF?Text=Image1_Feedback${index + 1}',
              'https://via.placeholder.com/150/00FF00/FFFFFF?Text=Image2_Feedback${index + 1}',
              'https://via.placeholder.com/150/0000FF/FFFFFF?Text=Image3_Feedback${index + 1}',
            ],
          ),
        );
      },
      separatorBuilder: (_, _) {
        return SizedBox(height: 12);
      },
      itemCount: 10,
    );
  }
}
