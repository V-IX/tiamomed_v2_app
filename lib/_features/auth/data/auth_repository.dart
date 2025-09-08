import '../../../_shared/data/secure_storage/secure_storage_service.dart';
import 'auth_api_service.dart';

class AuthRepository {
  AuthRepository({
    required AuthApiService authApiService,
    required SecureStorageService secureStorageService,
  }) : _authApiService = authApiService,
       _secureStorageService = secureStorageService;

  final AuthApiService _authApiService;
  final SecureStorageService _secureStorageService;

  Future<String> logIn({required String login, required String password}) async {
    final String doctorId = await _authApiService.logIn(login: login, password: password);

    return doctorId;
  }

  Future<void> sendSmsCode({required String phone, required String bday}) async {
    final String newToken = await _authApiService.sendSmsCode(phone: phone, bday: bday);

    await _secureStorageService.writeAccessToken(accessToken: newToken);

  }

  Future<String> checkSmsCode({required String smsCode}) async {
    final String fio = await _authApiService.checkSmsCode(smsCode: smsCode);
    return fio;
  }

  Future<void> logOut() async {
    await _secureStorageService.deleteAll();
    _authApiService.logOut();
  }

  Future<String> checkToken() async {
    final String fio = await _authApiService.checkToken();
    return fio;
  }
}
