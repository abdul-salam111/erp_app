import 'package:dio/dio.dart';
import '../exceptions/app_exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: err.type,
        error: _mapError(err),
        message: err.message,
      ),
    );
  }

  AppException _mapError(DioException error) {
    final statusCode = error.response?.statusCode;

    if (statusCode != null) {
      final msg = _extractMessage(error.response);
      return switch (statusCode) {
        400 => BadRequestException(msg ?? 'Bad request'),
        401 => UnauthorizedException(msg ?? 'Unauthorized access'),
        403 => ForbiddenException(msg ?? 'Access forbidden'),
        404 => NotFoundException(msg ?? 'Resource not found'),
        405 => MethodNotAllowedException(msg ?? 'Method not allowed'),
        408 => RequestTimeoutException(msg ?? 'Request timeout'),
        422 => InvalidInputException(msg ?? 'Invalid input data'),
        429 => TooManyRequestsException(msg ?? 'Too many requests'),
        500 => InternalServerErrorException(msg ?? 'Internal server error'),
        502 => InternalServerErrorException(msg ?? 'Bad gateway'),
        503 => ServiceUnavailableException(msg ?? 'Service unavailable'),
        504 => RequestTimeoutException(msg ?? 'Gateway timeout'),
        _ when statusCode >= 400 && statusCode < 500 =>
          BadRequestException(msg ?? 'Client error: $statusCode'),
        _ => InternalServerErrorException(msg ?? 'Server error: $statusCode'),
      };
    }

    return switch (error.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        RequestTimeoutException('Request timed out. Please check your connection and try again.'),
      DioExceptionType.connectionError =>
        NoInternetException('No internet connection. Please check your network and try again.'),
      DioExceptionType.badCertificate =>
        BadRequestException('Secure connection failed. Please try again.'),
      _ => FetchDataException('Something went wrong. Please try again.'),
    };
  }

  String? _extractMessage(Response? response) {
    if (response?.data == null) return null;
    try {
      final data = response!.data;
      if (data is Map) {
        return data['message'] as String? ??
            data['Message'] as String? ??
            data['error'] as String? ??
            data['Error'] as String? ??
            data['msg'] as String? ??
            data['detail'] as String? ??
            data['Detail'] as String? ??
            data['errorMessage'] as String? ??
            data['ErrorMessage'] as String?;
      }
      if (data is String) return data;
    } catch (_) {}
    return null;
  }
}
