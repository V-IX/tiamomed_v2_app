part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LogInEvent extends AuthEvent {
  LogInEvent({
    required this.login, 
    required this.password
  });

  final String login;
  final String password;

  
}

class CheckAuthEvent extends AuthEvent {}

class LogOutEvent extends AuthEvent {}

class LogInWithPhoneAndBDayEvent extends AuthEvent {
  LogInWithPhoneAndBDayEvent({
    required this.phone,
    required this.bday
  });

  final String phone;
  final String bday;

}

class CheckSmsCodeEvent extends AuthEvent {
  CheckSmsCodeEvent({
    required this.smsCode
  });

  final String smsCode;

}
