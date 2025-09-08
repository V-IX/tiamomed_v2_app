import 'package:dio/dio.dart';

import '../../../constants/urls.dart';
import '../../../utils/api_client/api_client.dart';
import '../../../utils/api_client/server_exception.dart';
import '../models/client_notification.dart';

class ClientNotificationsApiService {
  ClientNotificationsApiService({required ApiClient apiClient})
      : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<ClientNotification>> getNotifications() async {
    try {
      final Response<dynamic> response = await _apiClient.get(
          getClientNotificationsUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        return (data['notifications'] as List<dynamic>)
            .map((e) => ClientNotification.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw ServerException.fromDioError(
          DioException.badResponse(
            statusCode: 418,
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

  Future<void> markNotificationAsRead(String id) async {
    try {
      final Response<dynamic> response = await _apiClient.post(
          markNotificationAsReadUrl, data: FormData.fromMap({'id': id}));

      if (response.statusCode != 200) {
        return;
      } else {
        throw ServerException.fromDioError(
          DioException.badResponse(
            statusCode: 418,
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
