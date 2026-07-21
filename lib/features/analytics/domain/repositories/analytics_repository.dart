import '../../../../core/utils/result.dart';

abstract interface class AnalyticsRepository {
  // TODO: Define your repository methods here
  Future<Result<dynamic>> performAction();
}
