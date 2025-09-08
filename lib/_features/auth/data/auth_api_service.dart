

import 'package:dio/dio.dart';

import '../../../constants/urls.dart';
import '../../../utils/api_client/api_client.dart';
import '../../../utils/api_client/server_exception.dart';

class AuthApiService {
  AuthApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<String> logIn({required String login, required String password}) async {
    //todo implement
    return '103';
  }

  Future<String> sendSmsCode({required String phone, required String bday}) async {
    try {
      print(phone);
      print(bday);
      final Response<dynamic> response = await _apiClient.post(
        clientSendSmsUrl,
        data: FormData.fromMap({
          'phone': phone,
          'birthday': bday,
          'google_id': '12312312'
        })
      );


      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        return data['token'] as String;
      } else {
        throw ServerException.fromDioError(DioException.badResponse(
            statusCode: 666,
            requestOptions: response.requestOptions,
            response: response
        ));
      }

    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

  Future<String> checkSmsCode({required String smsCode}) async {
    try {
      print('start check sms');
      final Response<dynamic> response = await _apiClient.post(
          checkAuthSmsUrl,
          data: FormData.fromMap({
            'code': smsCode,
            'google_id': '12312312'
          })
      );
      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;

        return data['fio'] as String;
      } else {
        throw ServerException.fromDioError(DioException.badResponse(
            statusCode: 418,
            requestOptions: response.requestOptions,
            response: response
        ));
      }

    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

  Future<void> logOut() async {
    //todo implement
  }

  Future<String> checkToken() async {
    try {
      final Response<dynamic> response = await _apiClient.get(
          checkTokenUrl,
      );

      if(response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;

        return data['fio'] as String;
      } else {
        throw ServerException.fromDioError(DioException.badResponse(
            statusCode: 666,
            requestOptions: response.requestOptions,
            response: response
        ));
      }

    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

}
