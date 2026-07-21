import '../../../../core/utils/result.dart';

abstract interface class ProductionRepository {
  // TODO: Define your repository methods here
  Future<Result<dynamic>> performAction();
}
