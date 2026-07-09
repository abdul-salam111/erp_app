import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/purchase_order_entity.dart';

abstract interface class PurchaseOrderRepository {
  Future<Either<Failure, List<PurchaseOrderEntity>>> fetchOrders({
    required String fromDate,
    required String toDate,
    String? search,
  });
  Future<Either<Failure, dynamic>> createPurchaseOrder();
}
