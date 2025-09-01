import '../../../utils/api_client/api_client.dart';
import '../models/client_bonuses_history_item.dart';

class ClientBonusesApiService {
  ClientBonusesApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<ClientBonusesHistoryItem>> getBonusesHistory() async {
    return ClientBonusesHistoryItem.fakeList;
  }
}
