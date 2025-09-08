import '../models/client_certificate.dart';
import '../models/client_season_ticket.dart';
import 'client_loyalty_program_api_service.dart';

class ClientLoyaltyProgramRepository {
  ClientLoyaltyProgramRepository({
    required ClientLoyaltyProgramApiService clientLoyaltyProgramApiService,
  }) : _clientLoyaltyProgramApiService = clientLoyaltyProgramApiService;

  final ClientLoyaltyProgramApiService _clientLoyaltyProgramApiService;

  Future<List<ClientSeasonTicket>> getSeasonTickets() {
    return  _clientLoyaltyProgramApiService.getSeasonTickets();
  }

  Future<List<ClientCertificate>> getCertificates() {
    return  _clientLoyaltyProgramApiService.getCertificates();
  }

}
