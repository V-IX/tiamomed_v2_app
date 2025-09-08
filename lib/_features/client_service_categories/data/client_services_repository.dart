import '../models/client_service_category.dart';
import 'client_services_api_service.dart';

class ClientServicesRepository {
  ClientServicesRepository({required ClientServicesApiService clientServicesApiService}) : _clientServicesApiService = clientServicesApiService;

  final ClientServicesApiService _clientServicesApiService;

  Future<List<ClientServiceCategory>> getCategories() {
    return _clientServicesApiService.getCategories();
  }
}
