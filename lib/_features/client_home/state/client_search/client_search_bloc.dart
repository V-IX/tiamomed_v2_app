import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../data/client_search/client_search_repository.dart';
import '../../models/client_search_item.dart';

part 'client_search_event.dart';
part 'client_search_state.dart';

class ClientSearchBloc extends Bloc<ClientSearchEvent, ClientSearchState> {
  ClientSearchBloc({required ClientSearchRepository clientSearchRepository})
    : _clientSearchRepository = clientSearchRepository,
      super(ClientSearchInitial()) {
    on<GetClientSearchItemEvent>(_getSearchItemEvent);
  }

  final ClientSearchRepository _clientSearchRepository;
  final Logger _logger = Logger();

  Future<void> _getSearchItemEvent(
    GetClientSearchItemEvent event,
    Emitter<ClientSearchState> emit,
  ) async {
    try {
      emit(ClientSearchLoading());
      final List<ClientSearchItem> items = await _clientSearchRepository.getSearchItem(event.text);
      emit(ClientSearchLoaded(itemsForSearch: items));
    } catch (error) {
      _logger.e(error);
      emit(ClientSearchError(message: error.toString()));
    }
  }
}
