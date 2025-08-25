part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  AuthError({required this.message});

  final String message;

}

class Authenticated extends AuthState {
  Authenticated({required this.userType});

  final AuthUserType userType;
}

class Unauthenticated extends AuthState {}
