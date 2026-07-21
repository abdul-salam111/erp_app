import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../data/models/response_models/purchase_order_detail/purchase_order_detail.dart';
import '../repositories/purchase_order_repository.dart';

class GetPurchaseOrderByIdUsecase
    implements Usecase<PurchaseOrderDetail, int> {
  final PurchaseOrderRepository repository;

  GetPurchaseOrderByIdUsecase({required this.repository});

  @override
  Future<Result<PurchaseOrderDetail>> call(int params) {
    return repository.fetchOrderById(params);
  }
}
