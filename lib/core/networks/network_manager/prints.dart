import '../../utils/app_logger.dart';

/// Deprecated shim — use [appLogger] directly.
void printValue(dynamic value, {String tag = ''}) {
  appLogger.d('$tag $value');
}
