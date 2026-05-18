import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final appLogger = _AppLogger();

class _AppLogger {
  final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
    level: kDebugMode ? Level.trace : Level.off,
  );

  /// Debug — request/response details, internal flow.
  void d(dynamic message, {Object? error, StackTrace? stackTrace}) =>
      _logger.d(message, error: error, stackTrace: stackTrace);

  /// Info — significant lifecycle events (login, navigation).
  void i(dynamic message, {Object? error, StackTrace? stackTrace}) =>
      _logger.i(message, error: error, stackTrace: stackTrace);

  /// Warning — recoverable issues, deprecations.
  void w(dynamic message, {Object? error, StackTrace? stackTrace}) =>
      _logger.w(message, error: error, stackTrace: stackTrace);

  /// Error — exceptions, failed API calls.
  void e(dynamic message, {Object? error, StackTrace? stackTrace}) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}
