import 'client_service_details_api_service.dart';

class ClientServiceDetailsRepository {
  ClientServiceDetailsRepository({
    required ClientServiceDetailsApiService clientServiceDetailsApiService,
  }) : _clientServiceDetailsApiService = clientServiceDetailsApiService;

  final ClientServiceDetailsApiService _clientServiceDetailsApiService;

  Future<void> getClientServiceDetails({required String serviceId}) async {
    _clientServiceDetailsApiService.getClientServiceDetails(serviceId: serviceId);
  }

}
