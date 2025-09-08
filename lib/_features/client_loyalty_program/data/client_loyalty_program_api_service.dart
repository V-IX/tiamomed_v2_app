import 'package:dio/dio.dart';

import '../../../constants/urls.dart';
import '../../../utils/api_client/api_client.dart';
import '../../../utils/api_client/server_exception.dart';
import '../models/client_certificate.dart';
import '../models/client_season_ticket.dart';

class ClientLoyaltyProgramApiService {
  ClientLoyaltyProgramApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<ClientSeasonTicket>> getSeasonTickets() async {
    try {
      final Response<dynamic> response = await _apiClient.get(getSeasonTicketsUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        return (data['data'] as List<dynamic>)
            .map((e) => ClientSeasonTicket.fromJson(e as Map<String, dynamic>))
            .toList();
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

  Future<List<ClientCertificate>> getCertificates() async {
    try {
      final Response<dynamic> response = await _apiClient.get(getCertificatesUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        return (data['data'] as List<dynamic>)
            .map((e) => ClientCertificate.fromJson(e as Map<String, dynamic>))
            .toList();
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
