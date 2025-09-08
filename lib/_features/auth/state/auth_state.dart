part of 'auth_bloc.dart';

enum AuthStatus { initial, loading, smsSanded, authenticated, unauthenticated, error }

extension AuthStatusX on AuthStatus {
  bool get isInitial => this == AuthStatus.initial;
  bool get isLoading => this == AuthStatus.loading;
  bool get isError => this == AuthStatus.error;
  bool get isSmsSanded => this == AuthStatus.smsSanded;
  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isUnauthenticated => this == AuthStatus.unauthenticated;
}

class AuthState {
  AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.error = '',
    this.phone = '',
  });

  final AuthStatus status;
  final AuthUser? user;
  final String error;
  final String phone;

  AuthState copyWith({
    AuthStatus? status,
    AuthUser? user,
    String? error,
    String? phone,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
      phone: phone ?? this.phone,
    );
  }
}
