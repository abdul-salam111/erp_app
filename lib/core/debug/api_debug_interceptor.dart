import 'dart:convert';
import 'package:dio/dio.dart';
import 'api_debug_cubit.dart';
import 'api_debug_entry.dart';

class ApiDebugInterceptor extends Interceptor {
  final ApiDebugCubit cubit;

  ApiDebugInterceptor(this.cubit);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (cubit.state.isEnabled) {
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      options.extra['debugId'] = id;
      cubit.addEntry(ApiDebugEntry(
        id: id,
        method: options.method,
        url: options.uri.toString(),
        headers: Map<String, dynamic>.from(options.headers),
        requestBody: options.data,
        startTime: DateTime.now(),
      ));
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final id = response.requestOptions.extra['debugId'] as String?;
    if (id != null) {
      String? body;
      String? preview;
      try {
        body = jsonEncode(response.data);
        preview = body.length > 200 ? '${body.substring(0, 200)}…' : body;
      } catch (_) {
        body = response.data?.toString();
        preview = body;
      }
      cubit.completeEntry(
        id,
        statusCode: response.statusCode,
        responsePreview: preview,
        responseBody: body,
      );
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final id = err.requestOptions.extra['debugId'] as String?;
    if (id != null) {
      cubit.completeEntry(
        id,
        statusCode: err.response?.statusCode,
        isError: true,
        errorMessage: err.message ?? err.toString(),
      );
    }
    handler.next(err);
  }
}
