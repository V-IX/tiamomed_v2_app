part of 'client_feedback_bloc.dart';

@immutable
sealed class ClientFeedbackEvent {}

class GetClientFeedbacksEvent extends ClientFeedbackEvent {}

class SendClientFeedbackEvent extends ClientFeedbackEvent {
  SendClientFeedbackEvent({required this.rating, required this.text, required this.imagesPath});

  final int rating;
  final String text;
  final List<String> imagesPath;
}
