import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final int maxRetries;
  final Duration delay;

  RetryInterceptor({
    required this.dio,
    this.maxRetries = 3,
    this.delay = const Duration(seconds: 1),
  });

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (!_shouldRetry(err)) return handler.next(err);

    final retries = (err.requestOptions.extra['retries'] as int?) ?? 0;
    if (retries >= maxRetries) return handler.next(err);

    await Future.delayed(delay * (retries + 1));
    err.requestOptions.extra['retries'] = retries + 1;

    try {
      handler.resolve(await dio.fetch(err.requestOptions));
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  bool _shouldRetry(DioException err) {
    final isRetryableError = err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout;
    if (!isRetryableError) return false;

    // Only auto-retry requests that are safe to repeat. Non-idempotent
    // methods (POST, PATCH, DELETE, ...) may have already been processed
    // by the server even though the client never saw the response — blindly
    // retrying those risks duplicate records (e.g. duplicate orders).
    // Callers can opt in explicitly via extra['idempotent'] = true.
    if (_isIdempotentMethod(err.requestOptions.method)) return true;
    return err.requestOptions.extra['idempotent'] == true;
  }

  bool _isIdempotentMethod(String method) {
    switch (method.toUpperCase()) {
      case 'GET':
      case 'HEAD':
      case 'OPTIONS':
      case 'PUT':
      case 'DELETE':
        return true;
      default:
        return false;
    }
  }
}
