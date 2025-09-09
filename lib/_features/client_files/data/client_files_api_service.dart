import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import '../../../constants/urls.dart';
import '../../../utils/api_client/api_client.dart';
import '../../../utils/api_client/server_exception.dart';
import '../models/client_file.dart';

class ClientFilesApiService {
  ClientFilesApiService({required ApiClient apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  Future<List<ClientFile>> getFileNames() async {
    try {
      final Response<dynamic> response = await _apiClient.get(getClientFileNamesUrl);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;
        return (data['files'] as List).map((item) => ClientFile.fromJson(item as Map<String, dynamic>)).toList();
      } else {
        throw ServerException.fromDioError(
          DioException.badResponse(
            statusCode: 418,
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

  Future<String> getFile({
    required String fileName,
    required String savePath,
    required Function(int progress, int total) onProgress,
  }) async {
    try {
      final Response<dynamic> response = await _apiClient.get(
        '$getClientFileUrl?file=$fileName',
        options: Options(responseType: ResponseType.stream),
      );

      final int? totalSize = int.tryParse(response.headers.value(HttpHeaders.contentLengthHeader) ?? '');

      if (response.statusCode == 200) {
        final Stream<Uint8List> stream = (response.data as ResponseBody).stream;
        final File file = File('$savePath/$fileName');
        await file.create(recursive: true);
        int received = 0;



        final String passphrase = 'Fmr38XYTdHvUw3QuGbkRaf9uhhPQL8va';
        final List<int> keyBytes = crypto.sha256.convert(utf8.encode(passphrase)).bytes;
        final encrypt.Key key = encrypt.Key(Uint8List.fromList(keyBytes));
        final encrypt.Encrypter encrypter = encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.cbc, padding: 'PKCS7'));


        List<int> buffer = <int>[]; // Наш буфер для накопления байт
        const int blockSize = 16;

        await for (final Uint8List chunk in stream) {
          received += chunk.length;
          onProgress(received, totalSize ?? 0);
          buffer.addAll(chunk);
        }

        final List<int> ivBytes = buffer.sublist(0, blockSize);
        final encrypt.IV ivKey = encrypt.IV(Uint8List.fromList(ivBytes));

        final List<int> encryptedBytes = buffer.sublist(blockSize);

        final List<int> decryptedBytes = encrypter.decryptBytes(encrypt.Encrypted(Uint8List.fromList(encryptedBytes)), iv: ivKey);

        await file.writeAsBytes(decryptedBytes);


        return file.path;

      } else {
        throw ServerException.fromDioError(
          DioException.badResponse(
            statusCode: 418,
            requestOptions: response.requestOptions,
            response: response,
          ),
        );
      }
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

}
