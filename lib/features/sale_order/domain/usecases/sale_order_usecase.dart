import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/sale_order_repository.dart';

class SaleOrderUsecase implements Usecase<dynamic, NoParams> {
  final SaleOrderRepository repository;

  SaleOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
