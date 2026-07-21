import '../../../../core/utils/result.dart';

abstract interface class SystemRepository {
  // TODO: Define your repository methods here
  Future<Result<dynamic>> performAction();
}
