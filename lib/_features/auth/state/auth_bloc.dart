import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../data/auth_repository.dart';
import '../models/auth_user.dart';



part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository}):
    _authRepository = authRepository,
    super(AuthState()) {
      on<LogInEvent>(_logIn);
      on<CheckAuthEvent>(_checkAuth);
      on<LogOutEvent>(_logOut);
      on<LogInWithPhoneAndBDayEvent>(_sendSmsCode);
      on<CheckSmsCodeEvent>(_checkSmsCode);
    }

  final AuthRepository _authRepository;
  final Logger _logger = Logger();

  Future<void> _checkAuth(CheckAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final String fio = await _authRepository.checkToken();
      emit(state.copyWith(user: AuthUser(fio: fio, userType: UserType.sellerClient), status: AuthStatus.authenticated));
    } catch(error) {
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    }
  }

  Future<void> _sendSmsCode(LogInWithPhoneAndBDayEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      await _authRepository.sendSmsCode(phone: event.phone, bday: event.bday);
      emit(state.copyWith(status: AuthStatus.smsSanded, phone: event.phone));
    } catch(error) {
      _logger.e(error);
      final String message = error.toString().replaceAll('Exception: ', '').replaceAll('|', ' ');
      emit(state.copyWith(status: AuthStatus.error, error: message));
    }
  }

  Future<void> _checkSmsCode(CheckSmsCodeEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      final String fio = await _authRepository.checkSmsCode(smsCode: event.smsCode);
      emit(state.copyWith(user: AuthUser(fio: fio, userType: UserType.sellerClient), status: AuthStatus.authenticated));
      print(state.status);
    } catch(error) {
      final String message = error.toString().replaceAll('Exception: ', '').replaceAll('|', ' ');
      _logger.e(message);
      emit(state.copyWith(status: AuthStatus.error, error: message));
    }
  }


  Future<void> _logIn(LogInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      await _authRepository.logIn(login: event.login, password: event.password);
      //emit(state.copyWith(userType: UserType.sellerClient, status: AuthStatus.authenticated));
    } catch(error) {
      final String message = error.toString().replaceAll('Exception: ', '').replaceAll('|', ' ');
      emit(state.copyWith(status: AuthStatus.error, error: message));
    }
  }

  Future<void> _logOut(LogOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading));
      await _authRepository.logOut();
      emit(state.copyWith(status: AuthStatus.unauthenticated));
    } catch(error) {
      emit(state.copyWith(status: AuthStatus.error, error: error.toString()));
    }
  }

}
