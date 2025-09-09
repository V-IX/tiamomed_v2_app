import 'package:dio/dio.dart';

import '../../../constants/urls.dart';
import '../../../utils/api_client/api_client.dart';
import '../../../utils/api_client/server_exception.dart';
import '../models/client_bonuses_history.dart';
import '../models/client_bonuses_history_item.dart';

class ClientBonusesApiService {
  ClientBonusesApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;


  Future<double> getBonusesCount() async {
    try {
      final Response<dynamic> response = await _apiClient.get(
          getClientBonusesUrl,
      );


      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        return (data['data'] as Map<String, dynamic>)['sum'] as double? ?? 0.0;
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

  Future<ClientBonusesHistory> getBonusesHistoryFull() async {
    try {
      final Response<dynamic> response = await _apiClient.get(
          getClientBonusesUrl,
      );
      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        return ClientBonusesHistory.fromJson(data['data'] as Map<String, dynamic>);
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
