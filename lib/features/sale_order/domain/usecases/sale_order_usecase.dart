import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/sale_order_entity.dart';
import '../repositories/sale_order_repository.dart';

class SaleOrderUsecase implements Usecase<List<SaleOrderEntity>, NoParams> {
  final SaleOrderRepository repository;

  SaleOrderUsecase({required this.repository});

  @override
  Future<Result<List<SaleOrderEntity>>> call(NoParams params) {
    return repository.fetchOrders();
  }
}
