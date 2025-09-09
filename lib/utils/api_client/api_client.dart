import 'dart:ui';

import 'package:dio/dio.dart';

import '../../_shared/data/secure_storage/secure_storage_service.dart';

class ApiClient {
  ApiClient({
    required String baseUrl,
    required Map<String, String> headers,
    required this.flutterSecureStorage,
    required this.logOutCallback,
  }) : _dio = Dio(
         BaseOptions(
           baseUrl: baseUrl,
           connectTimeout: const Duration(seconds: 60),
           receiveTimeout: const Duration(seconds: 120),
           sendTimeout: const Duration(seconds: 120),
           contentType: Headers.multipartFormDataContentType,
           headers: headers,
         ),
       ) {
        _dio.interceptors.add(
            InterceptorsWrapper(
                onRequest: (RequestOptions options, RequestInterceptorHandler handler) async {
                  final String accessToken = await flutterSecureStorage.readAccessToken();
                  options.headers['Authorization'] = 'Bearer $accessToken';
                  print(accessToken);
                  return handler.next(options);
                },
                onError: (DioException err, ErrorInterceptorHandler handler) async {

                  final dynamic data = err.response?.data;

                  if(err.response?.statusCode == 401 && (data as Map<String, dynamic>)['message'] as String == 'Unauthenticated.') {
                    logOutCallback();
                  }

                  return handler.next(err);
                }
            )
        );
  }

  final Dio _dio;
  final SecureStorageService flutterSecureStorage;
  final VoidCallback logOutCallback;

  // POST METHOD
  Future<Response<dynamic>> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
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
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) async {
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

  Future<Response<dynamic>> download(
      String url, {
        required String fullFilePath,
        Map<String, dynamic>? queryParameters,
        Options? options,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response<dynamic> response = await _dio.download(
        url,
        fullFilePath,
        options: options,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }


}
