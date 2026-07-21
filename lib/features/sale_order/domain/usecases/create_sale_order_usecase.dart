import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/sale_order_repository.dart';

class CreateSaleOrderUsecase implements Usecase<dynamic, NoParams> {
  final SaleOrderRepository repository;

  CreateSaleOrderUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.createSaleOrder();
  }
}
