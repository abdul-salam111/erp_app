import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/purchase_order_detail_entity.dart';
import '../repositories/purchase_order_repository.dart';

class GetPurchaseOrderByIdUsecase
    implements Usecase<PurchaseOrderDetailEntity, int> {
  final PurchaseOrderRepository repository;

  GetPurchaseOrderByIdUsecase({required this.repository});

  @override
  Future<Result<PurchaseOrderDetailEntity>> call(int params) {
    return repository.fetchOrderById(params);
  }
}
