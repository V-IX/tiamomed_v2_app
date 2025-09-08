import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../constants/secure_storage_keys.dart';

class SecureStorageService {
  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  Future<String> readAccessToken() async {
    final String? token = await _flutterSecureStorage.read(
      key: ACCESS_TOKEN_KEY,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
    return token ?? '';
  }

  Future<void> writeAccessToken({required String accessToken}) async {
    return _flutterSecureStorage.write(
      key: ACCESS_TOKEN_KEY,
      value: accessToken,
      aOptions: const AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<void> deleteAll() async {
    return _flutterSecureStorage.deleteAll();
  }

}
