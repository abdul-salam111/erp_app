import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/purchase_order_entity.dart';

abstract interface class PurchaseOrderRepository {
  Future<Either<Failure, List<PurchaseOrderEntity>>> fetchOrders();
  Future<Either<Failure, dynamic>> createPurchaseOrder();
}
