import '../models/client_bonuses_history_item.dart';
import 'client_bonuses_api_service.dart';

class ClientBonusesRepository {
  ClientBonusesRepository({required ClientBonusesApiService clientBonusesApiService})
    : _clientBonusesApiService = clientBonusesApiService;

  final ClientBonusesApiService _clientBonusesApiService;

  Future<List<ClientBonusesHistoryItem>> getBonusesHistory() async {
    return _clientBonusesApiService.getBonusesHistory();
  }

}
