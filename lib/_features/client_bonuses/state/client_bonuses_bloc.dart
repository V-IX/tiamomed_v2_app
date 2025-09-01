import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../data/client_bonuses_repository.dart';
import '../models/client_bonuses_history_item.dart';

part 'client_bonuses_event.dart';
part 'client_bonuses_state.dart';

class ClientBonusesBloc extends Bloc<ClientBonusesEvent, ClientBonusesState> {
  ClientBonusesBloc({required ClientBonusesRepository clientBonusesRepository})
    : _clientBonusesRepository = clientBonusesRepository,
      super(ClientBonusesInitial()) {
    on<GetClientBonusesHistoryEvent>(_getBonusesHistory);
  }

  final ClientBonusesRepository _clientBonusesRepository;
  final Logger _logger = Logger();

  Future<void> _getBonusesHistory(
    GetClientBonusesHistoryEvent event,
    Emitter<ClientBonusesState> emit,
  ) async {
    try {
      emit(ClientBonusesLoading());
      final List<ClientBonusesHistoryItem> bonusesHistory = await _clientBonusesRepository
          .getBonusesHistory();
      final List<ClientBonusesHistoryItem> burningBonuses = bonusesHistory
          .where(
            (ClientBonusesHistoryItem element) => DateFormat(
              'yyyy-mm-dd',
            ).parse(element.date).isAfter(DateTime.now().subtract(const Duration(days: 1130))),
          )
          .toList();
      emit(ClientBonusesLoaded(bonusesHistory: bonusesHistory, burningBonuses: burningBonuses));
    } catch (e) {
      emit(ClientBonusesError(message: e.toString()));
      _logger.e(e);
    }
  }
}
