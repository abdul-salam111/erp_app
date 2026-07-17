import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/purchase_order_entity.dart';
import '../repositories/purchase_order_repository.dart';

class PurchaseOrderUsecase
    implements Usecase<List<PurchaseOrderEntity>, NoParams> {
  final PurchaseOrderRepository repository;

  PurchaseOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, List<PurchaseOrderEntity>>> call(NoParams params) {
    return repository.fetchOrders();
  }
}
