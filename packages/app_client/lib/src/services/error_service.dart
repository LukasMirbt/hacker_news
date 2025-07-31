import 'package:app_client/app_client.dart';
import 'package:http/http.dart';

class ErrorService {
  const ErrorService();

  bool isNetworkError(Object error) {
    if (error is! DioException) return false;

    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return true;
      case DioExceptionType.unknown:
        return error.error is ClientException;
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
      case DioExceptionType.cancel:
        return false;
    }
  }
}
