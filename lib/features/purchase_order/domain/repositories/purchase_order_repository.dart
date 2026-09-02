import '../../../../core/utils/result.dart';
import '../entities/party_option.dart';
import '../entities/purchase_order_detail_entity.dart';
import '../entities/purchase_order_entity.dart';

abstract interface class PurchaseOrderRepository {
  Future<Result<List<PurchaseOrderEntity>>> fetchOrders();
  Future<Result<PurchaseOrderDetailEntity>> fetchOrderById(int id);
  Future<Result<List<PartyOption>>> fetchParties();
  Future<Result<dynamic>> createPurchaseOrder();
}
