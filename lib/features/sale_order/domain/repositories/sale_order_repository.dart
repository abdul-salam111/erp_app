import '../../../../core/utils/result.dart';
import '../../data/models/response_models/sale_order_detail/sale_order_detail.dart';
import '../entities/party_option.dart';
import '../entities/sale_order_entity.dart';

abstract interface class SaleOrderRepository {
  Future<Result<List<SaleOrderEntity>>> fetchOrders();
  Future<Result<SaleOrderDetail>> fetchOrderById(int id);
  Future<Result<List<PartyOption>>> fetchParties();
  Future<Result<dynamic>> createSaleOrder();
}
