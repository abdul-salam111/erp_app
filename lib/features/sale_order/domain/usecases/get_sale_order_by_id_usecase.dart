import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/sale_order_detail_entity.dart';
import '../repositories/sale_order_repository.dart';

class GetSaleOrderByIdUsecase implements Usecase<SaleOrderDetailEntity, int> {
  final SaleOrderRepository repository;

  GetSaleOrderByIdUsecase({required this.repository});

  @override
  Future<Result<SaleOrderDetailEntity>> call(int params) {
    return repository.fetchOrderById(params);
  }
}
