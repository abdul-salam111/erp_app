import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../data/models/response_models/sale_order_detail/sale_order_detail.dart';
import '../entities/party_option.dart';
import '../entities/sale_order_entity.dart';

abstract interface class SaleOrderRepository {
  Future<Either<Failure, List<SaleOrderEntity>>> fetchOrders();
  Future<Either<Failure, SaleOrderDetail>> fetchOrderById(int id);
  Future<Either<Failure, List<PartyOption>>> fetchParties();
  Future<Either<Failure, dynamic>> createSaleOrder();
}
