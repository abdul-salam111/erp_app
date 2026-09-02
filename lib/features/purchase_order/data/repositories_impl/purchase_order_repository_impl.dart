import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/party_option.dart';
import '../../domain/entities/purchase_order_detail_entity.dart';
import '../../domain/entities/purchase_order_entity.dart';
import '../../domain/repositories/purchase_order_repository.dart';
import '../datasources/remote_purchase_order_datasource.dart';

class PurchaseOrderRepositoryImpl extends BaseRepository
    implements PurchaseOrderRepository {
  final IRemotePurchaseOrderDataSource dataSource;

  PurchaseOrderRepositoryImpl({required this.dataSource});

  @override
  Future<Result<List<PurchaseOrderEntity>>> fetchOrders() {
    return execute(
      call: () => dataSource.fetchOrders(),
    );
  }

  @override
  Future<Result<PurchaseOrderDetailEntity>> fetchOrderById(int id) {
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
  Future<Result<dynamic>> createPurchaseOrder() {
    return execute(
      call: () => dataSource.createPurchaseOrder(),
    );
  }
}
