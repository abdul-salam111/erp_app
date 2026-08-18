import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Lists longer than this in a logged response/error body are truncated to
/// keep the console readable — full data still reaches the app untouched.
const _maxLoggedListItems = 20;

Interceptor buildLoggingInterceptor() =>
    kDebugMode ? _TruncatingLoggingInterceptor() : Interceptor();

class _TruncatingLoggingInterceptor extends Interceptor {
  final _requestLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseHeader: false,
    responseBody: false,
    error: false,
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _requestLogger.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
      '⬅️ [${response.statusCode}] ${response.requestOptions.method} '
      '${response.requestOptions.uri}\n${_truncatedJson(response.data)}',
    );
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint(
      '⛔ [${err.response?.statusCode}] ${err.requestOptions.method} '
      '${err.requestOptions.uri}\n${_truncatedJson(err.response?.data)}',
    );
    handler.next(err);
  }

  String _truncatedJson(dynamic data) {
    try {
      return const JsonEncoder.withIndent('  ').convert(_truncateLists(data));
    } catch (_) {
      return data.toString();
    }
  }

  dynamic _truncateLists(dynamic value) {
    if (value is List) {
      final truncated = value.take(_maxLoggedListItems).map(_truncateLists).toList();
      if (value.length > _maxLoggedListItems) {
        truncated.add('… ${value.length - _maxLoggedListItems} more item(s) truncated');
      }
      return truncated;
    }
    if (value is Map) {
      return value.map((key, v) => MapEntry(key, _truncateLists(v)));
    }
    return value;
  }
}
