import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../data/models/response_models/purchase_order_detail/purchase_order_detail.dart';
import '../entities/party_option.dart';
import '../entities/purchase_order_entity.dart';

abstract interface class PurchaseOrderRepository {
  Future<Either<Failure, List<PurchaseOrderEntity>>> fetchOrders();
  Future<Either<Failure, PurchaseOrderDetail>> fetchOrderById(int id);
  Future<Either<Failure, List<PartyOption>>> fetchParties();
  Future<Either<Failure, dynamic>> createPurchaseOrder();
}
