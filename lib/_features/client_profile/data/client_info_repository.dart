import '../models/client_info.dart';
import 'client_info_api_service.dart';

class ClientInfoRepository {
  ClientInfoRepository({required ClientInfoApiService clientInfoApiService})
    : _clientInfoApiService = clientInfoApiService;

  final ClientInfoApiService _clientInfoApiService;

  Future<ClientInfo> getClientInfo() {
    return _clientInfoApiService.getClientInfo();
  }

  Future<void> updateClientInfo({required ClientInfo clientInfo}) {
    return _clientInfoApiService.updateClientInfo(clientInfo: clientInfo);
  }

}
