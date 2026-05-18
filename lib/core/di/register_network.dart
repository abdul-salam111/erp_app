import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../utils/app_logger.dart';
import '../networks/network_manager/dio_helper.dart';
import 'app_dependencies.dart';

Future<void> registerNetwork() async {
  sl.registerLazySingleton<Dio>(() => _createDio());
  sl.registerLazySingleton(() => DioHelper(dio: sl()));
}

Dio _createDio() {
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

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        appLogger.d('[→] ${options.method} ${options.uri}');
        appLogger.d('[→] Headers: ${options.headers}');
        try {
          appLogger.d('[→] Body: ${jsonEncode(options.data)}');
        } catch (_) {}
        return handler.next(options);
      },
      onResponse: (response, handler) {
        appLogger.i(
          '[←] ${response.statusCode} ${response.requestOptions.uri}',
        );
        appLogger.d('[←] Body: ${response.data}');
        return handler.next(response);
      },
      onError: (e, handler) {
        appLogger.e(
          '[✗] ${e.response?.statusCode} ${e.requestOptions.method} ${e.requestOptions.uri}',
          error: e,
          stackTrace: e.stackTrace,
        );
        return handler.next(e);
      },
    ),
  );

  return dio;
}
