import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';

abstract interface class PurchaseOrderRepository {
  // TODO: Define your repository methods here
  Future<Either<Failure, dynamic>> performAction();
}
