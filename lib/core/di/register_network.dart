import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../networks/network_manager/prints.dart';
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
        printValue(tag: 'API URL:', '${options.uri}');
        printValue(tag: 'HEADER:', options.headers);
        try {
          printValue(tag: 'REQUEST BODY:', jsonEncode(options.data));
        } catch (e) {
          printValue(tag: 'REQUEST BODY:', e.toString());
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        printValue(tag: 'API RESPONSE:', response.data);
        return handler.next(response);
      },
      onError: (e, handler) {
        printValue(tag: 'STATUS CODE:', '${e.response?.statusCode ?? ""}');
        printValue(tag: 'ERROR DATA:', '${e.response?.data ?? ""}');
        return handler.next(e);
      },
    ),
  );

  return dio;
}
