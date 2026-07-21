import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/party_option.dart';
import '../../domain/entities/sale_order_entity.dart';
import '../../domain/repositories/sale_order_repository.dart';
import '../datasources/remote_sale_order_datasource.dart';
import '../models/response_models/sale_order_detail/sale_order_detail.dart';

class SaleOrderRepositoryImpl extends BaseRepository
    implements SaleOrderRepository {
  final IRemoteSaleOrderDataSource dataSource;

  SaleOrderRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<SaleOrderEntity>>> fetchOrders() {
    return execute(
      call: () => dataSource.fetchOrders(),
    );
  }

  @override
  Future<Result<SaleOrderDetail>> fetchOrderById(int id) {
    return execute(
      call: () => dataSource.fetchOrderById(id),
    );
  }

  @override
  Future<Result<List<PartyOption>>> fetchParties() {
    return execute(
      call: () => dataSource.fetchParties(),
    );
  }

  @override
  Future<Result<dynamic>> createSaleOrder() {
    return execute(
      call: () => dataSource.createSaleOrder(),
    );
  }
}
