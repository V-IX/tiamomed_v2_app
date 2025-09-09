import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../../client_bonuses/data/client_bonuses_repository.dart';
import '../../../client_service_categories/data/client_services_repository.dart';
import '../../../client_service_categories/models/client_service_category.dart';

part 'client_home_event.dart';
part 'client_home_state.dart';

class ClientHomeBloc extends Bloc<ClientHomeEvent, ClientHomeState> {
  ClientHomeBloc({
    required ClientServicesRepository clientServicesRepository,
    required ClientBonusesRepository clientBonusesRepository,
  }) : _clientServicesRepository = clientServicesRepository,
       _clientBonusesRepository = clientBonusesRepository,
       super(ClientHomeInitial()) {
    on<LoadClientHomeEvent>(_loadClientHome);
  }

  final ClientServicesRepository _clientServicesRepository;
  final ClientBonusesRepository _clientBonusesRepository;
  final Logger _logger = Logger();

  Future<void> _loadClientHome(LoadClientHomeEvent event, Emitter<ClientHomeState> emit) async {
    try {
      emit(ClientHomeLoading());
      final List<ClientServiceCategory> categories = await _clientServicesRepository
          .getCategories();
      final double bonusesCount = await _clientBonusesRepository.getBonusesCount();
      emit(ClientHomeLoaded(categories: categories, bonusesCount: bonusesCount));
    } catch (e) {
      _logger.e(e);
      emit(ClientHomeError(message: e.toString()));
    }
  }
}
