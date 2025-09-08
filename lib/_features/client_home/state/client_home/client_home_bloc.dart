import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../../client_service_categories/data/client_services_repository.dart';
import '../../../client_service_categories/models/client_service_category.dart';

part 'client_home_event.dart';
part 'client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  ClientHomeBloc({required ClientServicesRepository clientServicesRepository})
    : _clientServicesRepository = clientServicesRepository,
      super(ClientHomeInitial()) {
    on<LoadClientHomeEvent>(_loadClientHome);
  }

  final ClientServicesRepository _clientServicesRepository;
  final Logger _logger = Logger();

  Future<void> _loadClientHome(LoadClientHomeEvent event, Emitter<ClientHomeState> emit) async {
    try {
      emit(ClientHomeLoading());
      final List<ClientServiceCategory> categories = await _clientServicesRepository.getCategories();
      emit(ClientHomeLoaded(categories: categories));
    } catch (e) {
      _logger.e(e);
      emit(ClientHomeError(message: e.toString()));
    }
  }
}
