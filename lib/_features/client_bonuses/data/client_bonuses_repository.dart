import '../models/client_bonuses_history.dart';
import '../models/client_bonuses_history_item.dart';
import 'client_bonuses_api_service.dart';

class ClientBonusesRepository {
  ClientBonusesRepository({required ClientBonusesApiService clientBonusesApiService})
    : _clientBonusesApiService = clientBonusesApiService;

  final ClientBonusesApiService _clientBonusesApiService;

  Future<double> getBonusesCount(){
    return _clientBonusesApiService.getBonusesCount();
  }

  Future<ClientBonusesHistory> getBonusesHistory() {
    return _clientBonusesApiService.getBonusesHistoryFull();
  }

}
