import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/purchase_order_repository.dart';

class CreatePurchaseOrderUsecase implements Usecase<dynamic, NoParams> {
  final PurchaseOrderRepository repository;

  CreatePurchaseOrderUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.createPurchaseOrder();
  }
}
