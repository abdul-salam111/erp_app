import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/purchase_order_entity.dart';
import '../../domain/repositories/purchase_order_repository.dart';
import '../datasources/remote_purchase_order_datasource.dart';

class PurchaseOrderRepositoryImpl extends BaseRepository
    implements PurchaseOrderRepository {
  final IRemotePurchaseOrderDataSource dataSource;

  PurchaseOrderRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<PurchaseOrderEntity>>> fetchOrders({
    required String fromDate,
    required String toDate,
    String? search,
  }) {
    return execute(
      call: () => dataSource.fetchOrders(
        fromDate: fromDate,
        toDate: toDate,
        search: search,
      ),
    );
  }
}
