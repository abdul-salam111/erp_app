import '../../../../core/utils/result.dart';
import '../entities/party_option.dart';
import '../entities/sale_order_detail_entity.dart';
import '../entities/sale_order_entity.dart';

abstract interface class SaleOrderRepository {
  Future<Result<List<SaleOrderEntity>>> fetchOrders();
  Future<Result<SaleOrderDetailEntity>> fetchOrderById(int id);
  Future<Result<List<PartyOption>>> fetchParties();
  Future<Result<dynamic>> createSaleOrder();
}
