import 'package:dio/dio.dart';

import '../config/app_config.dart';
import '../error/app_exception.dart';

Dio createDio(AppConfig config) {
  final dio = Dio(
    BaseOptions(
      baseUrl: config.apiBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  );
  return dio;
}

Never mapDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw const NetworkException(
        'The request timed out. Your changes are saved and will retry.',
      );
    case DioExceptionType.connectionError:
      throw const NetworkException(
        'Could not reach the server. Check your connection.',
      );
    case DioExceptionType.badResponse:
      final status = e.response?.statusCode;
      final data = e.response?.data;
      final message =
          _extractMessage(data) ??
          'Server error${status != null ? ' ($status)' : ''}.';
      throw ServerException(message, statusCode: status);
    default:
      throw NetworkException(e.message ?? 'Network request failed.');
  }
}

String? _extractMessage(dynamic data) {
  if (data is Map) {
    final message = data['message'] ?? data['error'];
    if (message is String && message.isNotEmpty) return message;
  }
  if (data is String && data.isNotEmpty) return data;
  return null;
}
