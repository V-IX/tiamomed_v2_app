import 'package:dio/dio.dart';

class ApiClient {

  ApiClient({required String baseUrl, required Map<String, String> headers}) : _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 120),
      sendTimeout: const Duration(seconds: 120),
      contentType: Headers.multipartFormDataContentType,
      headers: headers
    ),
  ) {
    print(baseUrl);
    print(headers);
  }


  final Dio _dio;

  // POST METHOD
  Future<Response<dynamic>> post(
    String url,
    {
      dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
    }
  ) async {
    try {
      final Response<dynamic> response = await _dio.post(
        url,
        data: data,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // GET METHOD
  Future<Response<dynamic>> get(
    String url,
    {
      Map<String, dynamic>? queryParameters,
      Options? options,
      ProgressCallback? onReceiveProgress,
    }
  ) async {
    try {
      final Response<dynamic> response = await _dio.get(
        url,
        options: options,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
