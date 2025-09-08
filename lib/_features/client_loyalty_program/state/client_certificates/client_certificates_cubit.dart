import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/client_loyalty_program_api_service.dart';
import '../../data/client_loyalty_program_repository.dart';
import '../../models/client_certificate.dart';

part 'client_certificates_state.dart';

class ClientCertificatesCubit extends Cubit<ClientCertificatesState> {
  ClientCertificatesCubit({required ClientLoyaltyProgramRepository clientLoyaltyProgramRepository})
    : _clientLoyaltyProgramRepository = clientLoyaltyProgramRepository,
      super(ClientCertificatesInitial());

  final ClientLoyaltyProgramRepository _clientLoyaltyProgramRepository;

  Future<void> getCertificates() async {
    try {
      emit(ClientCertificatesLoading());
      final List<ClientCertificate> certificates = await _clientLoyaltyProgramRepository
          .getCertificates();
      emit(ClientCertificatesLoaded(certificates: certificates));
    } catch (e) {
      print(e);
      emit(ClientCertificatesError(message: e.toString()));
    }
  }
}
