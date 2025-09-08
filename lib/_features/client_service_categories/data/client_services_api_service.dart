import 'package:dio/dio.dart';

import '../../../constants/urls.dart';
import '../../../utils/api_client/api_client.dart';
import '../../../utils/api_client/server_exception.dart';
import '../models/client_service_category.dart';

class ClientServicesApiService {
  ClientServicesApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<ClientServiceCategory>> getCategories() async {
    try {
      final Response<dynamic> response = await _apiClient.get(
        getClientServicesUrl,
      );

      if (response.statusCode == 200) {
        final dynamic data = response.data as Map<String, dynamic>;

        return (data['items'] as List<dynamic>).map((dynamic item) => ClientServiceCategory.fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw ServerException.fromDioError(DioException.badResponse(
            statusCode: 666,
            requestOptions: response.requestOptions,
            response: response
        ));
      }

    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }
}