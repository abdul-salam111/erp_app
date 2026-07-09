import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/purchase_order_repository.dart';

class CreatePurchaseOrderUsecase implements Usecase<dynamic, NoParams> {
  final PurchaseOrderRepository repository;

  CreatePurchaseOrderUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.createPurchaseOrder();
  }
}
