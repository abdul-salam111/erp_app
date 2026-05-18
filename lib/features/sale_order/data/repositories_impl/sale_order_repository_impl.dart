import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/sale_order_repository.dart';
import '../datasources/remote_sale_order_datasource.dart';

class SaleOrderRepositoryImpl extends BaseRepository
    implements SaleOrderRepository {
  final IRemoteSaleOrderDataSource dataSource;

  SaleOrderRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
