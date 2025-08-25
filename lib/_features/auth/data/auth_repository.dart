import 'auth_api_service.dart';

class AuthRepository {
  AuthRepository({
    required AuthApiService authApiService,
  }) : _authApiService = authApiService;


  final AuthApiService _authApiService;

  Future<String> logIn({required String login, required String password}) async {
    final String doctorId = await _authApiService.logIn(login: login, password: password);

    return doctorId;
  }

  Future<void> logOut() async {
    _authApiService.logOut();
  }

  Future<void> checkToken() async {
    _authApiService.checkToken();
  }

}
