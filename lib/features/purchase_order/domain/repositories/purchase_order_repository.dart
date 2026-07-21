import '../../../../core/utils/result.dart';
import '../../data/models/response_models/purchase_order_detail/purchase_order_detail.dart';
import '../entities/party_option.dart';
import '../entities/purchase_order_entity.dart';

abstract interface class PurchaseOrderRepository {
  Future<Result<List<PurchaseOrderEntity>>> fetchOrders();
  Future<Result<PurchaseOrderDetail>> fetchOrderById(int id);
  Future<Result<List<PartyOption>>> fetchParties();
  Future<Result<dynamic>> createPurchaseOrder();
}
