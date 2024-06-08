import 'package:dio/dio.dart';

class DioErrorHandler {
  static Future<String> handleError(DioException e) async {
    if (e.response != null) {
      if (e.response!.statusCode == 401) {
        return 'Unauthorized';
      } else if (e.response!.statusCode == 404) {
        return 'Not Found';
      } else if (e.response!.statusCode == 500) {
        return 'Internal Server Error';
      } else {
        return 'Unknown Error';
      }
    } else {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return 'Connection Timeout';
      } else if (e.type == DioExceptionType.cancel) {
        return 'Request Cancelled';
      } else {
        return 'Unknown Error';
      }
    }
  }
}
