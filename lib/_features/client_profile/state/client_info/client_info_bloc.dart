import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/client_info_repository.dart';
import '../../models/client_info.dart';

part 'client_info_event.dart';
part 'client_info_state.dart';

class ClientInfoBloc extends Bloc<ClientInfoEvent, ClientInfoState> {
  ClientInfoBloc({required ClientInfoRepository clientInfoRepository})
    : _clientInfoRepository = clientInfoRepository,
      super(ClientInfoInitial()) {
    on<GetClientInfoEvent>(_getClientInfo);
    on<UpdateClientInfoEvent>(updateClientInfo);
  }

  final ClientInfoRepository _clientInfoRepository;

  Future<void> _getClientInfo(GetClientInfoEvent event, Emitter<ClientInfoState> emit) async {
    try {
      emit(ClientInfoLoading());
      final ClientInfo clientInfo = await _clientInfoRepository.getClientInfo();
      emit(ClientInfoLoaded(clientInfo: clientInfo));
    } catch (e) {
      emit(ClientInfoError(e.toString()));
    }
  }

  Future<void> updateClientInfo(UpdateClientInfoEvent event, Emitter<ClientInfoState> emit) async {
    try {
      emit(ClientInfoLoading());
      await _clientInfoRepository.updateClientInfo(clientInfo: event.clientInfo);
      emit(ClientInfoLoaded(clientInfo: event.clientInfo));
    } catch (e) {
      emit(ClientInfoError(e.toString()));
    }
  }

}
