import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/sale_order_repository.dart';

class CreateSaleOrderUsecase implements Usecase<dynamic, NoParams> {
  final SaleOrderRepository repository;

  CreateSaleOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.createSaleOrder();
  }
}
