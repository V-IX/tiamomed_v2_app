import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme/text_field_theme.dart';
import '../state/client_feedback_bloc.dart';
import 'feedback_image_picker.dart';
import 'feedback_stars_selector.dart';

class ClientFeedbackForm extends StatefulWidget {
  const ClientFeedbackForm({super.key});

  @override
  State<ClientFeedbackForm> createState() => _ClientFeedbackFormState();
}

class _ClientFeedbackFormState extends State<ClientFeedbackForm> {
  final TextEditingController _feedbackTextController = TextEditingController();

  int selectedStarCount = 0;

  final List<String> _images = <String>[];

  @override
  void dispose() {
    _feedbackTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text('Оцените нашу работу', style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: FeedbackStarsSelector(
                selectedStarCount: selectedStarCount,
                starTap: (int starCount) {
                  setState(() {
                    selectedStarCount = starCount;
                  });
                },
              ),
            ),

            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: Text('Прикрепите фотографии', style: Theme.of(context).textTheme.titleMedium),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22.0),
              child: FeedbackImagePicker(
                images: _images,
                addImagePath: (String imagePath) {
                  setState(() {
                    _images.add(imagePath);
                  });
                },
                removeImagePath: (int index) {
                  setState(() {
                    _images.removeAt(index);
                  });
                },
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: _feedbackTextController,
              minLines: 10,
              maxLines: 15,
              decoration: largeTextFieldDecoration,
            ),
            const SizedBox(height: 22),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: FilledButton(
                  onPressed: () {
                    context.read<ClientFeedbackBloc>().add(
                      SendClientFeedbackEvent(
                        rating: selectedStarCount,
                        text: _feedbackTextController.text,
                        imagesPath: _images,
                      )
                    );
                  },
                  child: const Text('Отправить')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
