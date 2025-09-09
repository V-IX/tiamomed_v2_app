import '../../models/client_search_item.dart';
import 'client_search_api_service.dart';

class ClientSearchRepository {
  ClientSearchRepository({required ClientSearchApiService clientSearchApiService})
    : _clientSearchApiService = clientSearchApiService;

  final ClientSearchApiService _clientSearchApiService;

  Future<List<ClientSearchItem>> getSearchItem(String text) async {
    return _clientSearchApiService.getSearchItems(text);
  }

}
