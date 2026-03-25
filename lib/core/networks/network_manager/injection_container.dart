import 'dart:convert';
import 'dart:io'; // <-- Add this for HttpClient
import 'package:dio/dio.dart';
import 'package:dio/io.dart'; // <-- Add this for IOHttpClientAdapter
import 'prints.dart';

Dio getDio() {
  Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  );

  // Add HTTP adapter configuration for better connection handling
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
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        printValue(tag: 'API URL:', '${options.uri}');
        printValue(tag: 'HEADER:', options.headers);
        try {
          printValue(tag: 'REQUEST BODY:', jsonEncode(options.data));
        } catch (e) {
          printValue(tag: "Request Body", e.toString());
        }
        return handler.next(options);
      },

      onResponse: (Response response, ResponseInterceptorHandler handler) {
        printValue(tag: 'API RESPONSE:', response.data);
        return handler.next(response);
      },

      onError: (DioException e, ErrorInterceptorHandler handler) {
        printValue(tag: 'STATUS CODE:', "${e.response?.statusCode ?? ""}");
        printValue(tag: 'ERROR DATA:', "${e.response?.data ?? ""}");
        return handler.next(e);
      },
    ),
  );

  return dio;
}
