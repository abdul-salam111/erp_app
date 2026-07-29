import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Interceptor buildLoggingInterceptor() => kDebugMode
    ? PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      )
    : Interceptor();
