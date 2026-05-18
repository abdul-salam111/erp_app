import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/purchase_order_repository.dart';

class PurchaseOrderUsecase implements Usecase<dynamic, NoParams> {
  final PurchaseOrderRepository repository;

  PurchaseOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
