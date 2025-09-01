import '../../../utils/api_client/api_client.dart';

class ClientServiceDetailsApiService {
  ClientServiceDetailsApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<void> getClientServiceDetails({required String serviceId}) async {

  }

}
