

import '../../../utils/api_client/api_client.dart';

class AuthApiService {
  AuthApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<String> logIn({required String login, required String password}) async {
    //todo implement
    return '103';
  }

  Future<void> logOut() async {
    //todo implement
  }

  Future<void> checkToken() async {
  }

}
