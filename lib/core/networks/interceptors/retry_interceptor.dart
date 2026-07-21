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

  bool _shouldRetry(DioException err) =>
      err.type == DioExceptionType.connectionError ||
      err.type == DioExceptionType.connectionTimeout;
}
