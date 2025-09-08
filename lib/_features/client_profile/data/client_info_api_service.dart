import 'package:dio/dio.dart';

import '../../../constants/urls.dart';
import '../../../utils/api_client/api_client.dart';
import '../../../utils/api_client/server_exception.dart';
import '../models/client_info.dart';

class ClientInfoApiService {
  ClientInfoApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<ClientInfo> getClientInfo() async {
    try {
      final Response<dynamic> response = await _apiClient.get(
        getClientInfoUrl,
      );

      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;

        return ClientInfo.fromJson(data['data'] as Map<String, dynamic>);
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

  Future<void> updateClientInfo({required ClientInfo clientInfo}) async {
    try {
      final Response<dynamic> response = await _apiClient.post(
        updateClientInfoUrl,
        data: FormData.fromMap(clientInfo.toJson())
      );

      if(response.statusCode == 200) {
        return;
      } else {
        throw ServerException.fromDioError(DioException.badResponse(
            statusCode: 418,
            requestOptions: response.requestOptions,
            response: response
        ));
      }

    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }
}