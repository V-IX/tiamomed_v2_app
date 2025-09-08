import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart';

import '../data/client_feedback_repository.dart';
import '../models/client_feedback.dart';

part 'client_feedback_event.dart';
part 'client_feedback_state.dart';

class ClientFeedbackBloc extends Bloc<ClientFeedbackEvent, ClientFeedbackState> {
  ClientFeedbackBloc({required ClientFeedbackRepository clientFeedbackRepository})
    : _clientFeedbackRepository = clientFeedbackRepository,
      super(ClientFeedbackState()) {
    on<GetClientFeedbacksEvent>(_getClientFeedbacks);
    on<SendClientFeedbackEvent>(_sendClientFeedback);
  }

  final ClientFeedbackRepository _clientFeedbackRepository;
  final Logger _logger = Logger();

  Future<void> _getClientFeedbacks(GetClientFeedbacksEvent event, Emitter<ClientFeedbackState> emit) async {
    try {
      emit(state.copyWith(status: ClientFeedbackStatus.loading));
      final List<ClientFeedback> feedbacks = await _clientFeedbackRepository.getFeedbacks();
      emit(state.copyWith(feedbacks: feedbacks, status: ClientFeedbackStatus.loaded));
    } on Exception catch (e) {
      _logger.e(e);
      emit(state.copyWith(status: ClientFeedbackStatus.error, message: e.toString()));
    }
  }

  Future<void> _sendClientFeedback(SendClientFeedbackEvent event, Emitter<ClientFeedbackState> emit) async {
    try {
      emit(state.copyWith(status: ClientFeedbackStatus.loading));
      final ClientFeedback feedback = await _clientFeedbackRepository.sendFeedback(
        rating: event.rating,
        text: event.text,
        imagesPath: event.imagesPath,
      );
      emit(state.copyWith(feedbacks: [feedback, ...state.feedbacks], status: ClientFeedbackStatus.loaded));
    } on Exception catch (e) {
      _logger.e(e);
      emit(state.copyWith(status: ClientFeedbackStatus.error, message: e.toString()));
    }
  }
}
