import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../interceptors/error_interceptor.dart';
import '../interceptors/logging_interceptor.dart';
import '../interceptors/retry_interceptor.dart';

class DioClient {
  DioClient._();

  static Dio create() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = HttpClient();
        client.idleTimeout = const Duration(seconds: 10);
        client.connectionTimeout = const Duration(seconds: 30);
        return client;
      },
    );

    dio.interceptors.addAll([
      ErrorInterceptor(),
      RetryInterceptor(dio: dio),
      buildLoggingInterceptor(),
    ]);

    return dio;
  }
}
