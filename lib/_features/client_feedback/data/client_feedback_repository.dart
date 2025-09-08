import '../models/client_feedback.dart';
import 'client_feedback_api_service.dart';

class ClientFeedbackRepository {
  ClientFeedbackRepository({required ClientFeedbackApiService clientFeedbackApiService})
    : _clientFeedbackApiService = clientFeedbackApiService;

  final ClientFeedbackApiService _clientFeedbackApiService;

  Future<List<ClientFeedback>> getFeedbacks() {
    return _clientFeedbackApiService.getFeedbacks();
  }

  Future<ClientFeedback> sendFeedback({
    required int rating,
    required String text,
    required List<String> imagesPath,
  }) {
    return _clientFeedbackApiService.sendFeedback(rating: rating, text: text, imagesPath: imagesPath);
  }
}
