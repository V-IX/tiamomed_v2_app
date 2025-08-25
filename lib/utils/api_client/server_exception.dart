import 'package:dio/dio.dart';

class ServerException implements Exception {

  ServerException.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.badResponse:
        errorMessage = _handleStatusCode(dioException.response?.statusCode);
      case DioExceptionType.connectionTimeout:
        errorMessage = 'Время соединения истекло';
      case DioExceptionType.sendTimeout:
        errorMessage = 'Время отправки запроса истекло';
      case DioExceptionType.badCertificate:
        errorMessage = 'Неверный сертификат';
      case DioExceptionType.cancel:
        errorMessage = 'Запрос к серверу был отменен';
      case DioExceptionType.unknown:
        errorMessage = 'Произошла непредвиденная ошибка';
      case DioExceptionType.connectionError:
        errorMessage = 'Ошибка соединения';
      case DioExceptionType.receiveTimeout:
        errorMessage = 'Время приема истекло';
    }
  }

  late String errorMessage;

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Плохой запрос';
      case 401:
        return 'Сбой аутентификации';
      case 403:
        return 'Пользователь не авторизован для доступа к API';
      case 404:
        return 'Запрашиваемый ресурс не существует';
      case 405:
        return 'Операция не разрешена';
      case 415:
        return 'Тип носителя не поддерживается';
      case 422:
        return 'Сбой проверки данных';
      case 429:
        return 'Слишком много запросов';
      case 500:
        return 'Внутренняя ошибка сервера';
      case 503:
        return 'Внутренняя ошибка сервера';
      default:
        return 'Произошла непредвиденная ошибка';
    }
  }

  @override
  String toString() => errorMessage;
}
