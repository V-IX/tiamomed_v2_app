import 'client_search_api_service.dart';

class ClientSearchRepository {
  ClientSearchRepository({required ClientSearchApiService clientSearchApiService})
    : _clientSearchApiService = clientSearchApiService;

  final ClientSearchApiService _clientSearchApiService;

  Future<List<String>> getSearchItem(String text) async {
    return _clientSearchApiService.getSearchItem(text);
  }

}
