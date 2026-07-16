import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/sale_order_entity.dart';
import '../../domain/repositories/sale_order_repository.dart';
import '../datasources/remote_sale_order_datasource.dart';

class SaleOrderRepositoryImpl extends BaseRepository
    implements SaleOrderRepository {
  final IRemoteSaleOrderDataSource dataSource;

  SaleOrderRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<SaleOrderEntity>>> fetchOrders({
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

  @override
  Future<Either<Failure, dynamic>> createSaleOrder() {
    return execute(
      call: () => dataSource.createSaleOrder(),
    );
  }
}
