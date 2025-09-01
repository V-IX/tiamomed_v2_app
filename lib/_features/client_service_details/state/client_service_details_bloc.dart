import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../data/client_service_details_repository.dart';

part 'client_service_details_event.dart';
part 'client_service_details_state.dart';

class ClientServiceDetailsBloc extends Bloc<ClientServiceDetailsEvent, ClientServiceDetailsState> {
  ClientServiceDetailsBloc({required ClientServiceDetailsRepository clientServiceDetailsRepository})
    : _clientServiceDetailsRepository = clientServiceDetailsRepository,
      super(ClientServiceDetailsInitial()) {
    on<GetClientServiceDetailsEvent>(_getClientServiceDetails);
  }

  final ClientServiceDetailsRepository _clientServiceDetailsRepository;
  final Logger _logger = Logger();

  Future<void> _getClientServiceDetails(
    GetClientServiceDetailsEvent event,
    Emitter<ClientServiceDetailsState> emit,
  ) async {
    try {
      emit(ClientServiceDetailsLoading());
      await _clientServiceDetailsRepository.getClientServiceDetails(serviceId: event.serviceId);
      emit(ClientServiceDetailsLoaded());
    } catch (e) {
      emit(ClientServiceDetailsError(message: e.toString()));
      _logger.e(e);
    }
  }
}
