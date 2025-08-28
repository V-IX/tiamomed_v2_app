import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/auth_repository.dart';
import '../models/auth_user_type.dart';



part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository}):
    _authRepository = authRepository,
    super(AuthInitial()) {
      on<LogInEvent>(_logIn);
      on<CheckAuthEvent>(_checkAuth);
      on<LogOutEvent>(_logOut);
    }

  final AuthRepository _authRepository;

  Future<void> _checkAuth(CheckAuthEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      await _authRepository.checkToken();
      emit(Authenticated(userType: AuthUserType(userType: UserType.client)));
    } catch(error) {
      emit(Unauthenticated());
    }
  }

  Future<void> _logIn(LogInEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      await _authRepository.logIn(login: event.login, password: event.password);
      emit(Authenticated(userType: AuthUserType(userType: UserType.client)));
    } catch(error) {
      final String message = error.toString().replaceAll('Exception: ', '').replaceAll('|', ' ');
      emit(AuthError(message: message));
    }
  }

  Future<void> _logOut(LogOutEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      await _authRepository.logOut();
      emit(Unauthenticated());
    } catch(error) {
      emit(AuthError(message: error.toString()));
    }
  }

}
