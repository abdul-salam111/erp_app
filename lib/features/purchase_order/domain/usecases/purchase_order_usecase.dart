import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/purchase_order_entity.dart';
import '../repositories/purchase_order_repository.dart';

class PurchaseOrderUsecase
    implements Usecase<List<PurchaseOrderEntity>, NoParams> {
  final PurchaseOrderRepository repository;

  PurchaseOrderUsecase({required this.repository});

  @override
  Future<Result<List<PurchaseOrderEntity>>> call(NoParams params) {
    return repository.fetchOrders();
  }
}
