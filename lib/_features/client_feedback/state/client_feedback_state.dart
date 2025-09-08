part of 'client_feedback_bloc.dart';

enum ClientFeedbackStatus { initial, loading, error, loaded }

class ClientFeedbackState {
  ClientFeedbackState({
    this.status = ClientFeedbackStatus.initial,
    this.message = '',
    this.feedbacks = const <ClientFeedback>[],
  });

  final ClientFeedbackStatus status;
  final String message;
  final List<ClientFeedback> feedbacks;

  ClientFeedbackState copyWith({
    ClientFeedbackStatus? status,
    String? message,
    List<ClientFeedback>? feedbacks,
  }) {
    return ClientFeedbackState(
      status: status ?? this.status,
      message: message ?? this.message,
      feedbacks: feedbacks ?? this.feedbacks,
    );
  }
}
