import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/party_option.dart';
import '../../domain/entities/purchase_order_entity.dart';
import '../../domain/repositories/purchase_order_repository.dart';
import '../datasources/remote_purchase_order_datasource.dart';
import '../models/response_models/purchase_order_detail/purchase_order_detail.dart';

class PurchaseOrderRepositoryImpl extends BaseRepository
    implements PurchaseOrderRepository {
  final IRemotePurchaseOrderDataSource dataSource;

  PurchaseOrderRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<PurchaseOrderEntity>>> fetchOrders() {
    return execute(
      call: () => dataSource.fetchOrders(),
    );
  }

  @override
  Future<Either<Failure, PurchaseOrderDetail>> fetchOrderById(int id) {
    return execute(
      call: () => dataSource.fetchOrderById(id),
    );
  }

  @override
  Future<Either<Failure, List<PartyOption>>> fetchParties() {
    return execute(
      call: () => dataSource.fetchParties(),
    );
  }

  @override
  Future<Either<Failure, dynamic>> createPurchaseOrder() {
    return execute(
      call: () => dataSource.createPurchaseOrder(),
    );
  }
}
