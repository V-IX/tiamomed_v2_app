import 'package:dio/dio.dart';

import '../../../constants/urls.dart';
import '../../../utils/api_client/api_client.dart';
import '../../../utils/api_client/server_exception.dart';
import '../models/client_feedback.dart';

class ClientFeedbackApiService {
  ClientFeedbackApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<ClientFeedback>> getFeedbacks() async {
    try {
      final Response<dynamic> response = await _apiClient.get(getFeedbacksUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        final List<ClientFeedback> feedbacks = (data['reviews'] as List<dynamic>)
            .map((json) => ClientFeedback.fromJson(json as Map<String, dynamic>))
            .toList();
        return feedbacks;
      } else {
        throw ServerException.fromDioError(
          DioException.badResponse(
            statusCode: 666,
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

  Future<ClientFeedback> sendFeedback({
    required int rating,
    required String text,
    required List<String> imagesPath,
  }) async {
    try {
      final Response<dynamic> response = await _apiClient.post(
        addFeedbackUrl,
        data: FormData.fromMap({
          'estimation': rating,
          'text': text,
          'images': imagesPath.map((path) => MultipartFile.fromFileSync(path)).toList(),
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        return ClientFeedback.fromJson(data['review'] as Map<String, dynamic>);
      } else {
        throw ServerException.fromDioError(
          DioException.badResponse(
            statusCode: 666,
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }
}
