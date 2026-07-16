import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/sale_order_entity.dart';

abstract interface class SaleOrderRepository {
  Future<Either<Failure, List<SaleOrderEntity>>> fetchOrders({
    required String fromDate,
    required String toDate,
    String? search,
  });
  Future<Either<Failure, dynamic>> createSaleOrder();
}
