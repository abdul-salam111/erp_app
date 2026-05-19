import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/inventory_repository.dart';
import '../datasources/remote_inventory_datasource.dart';

class InventoryRepositoryImpl extends BaseRepository
    implements InventoryRepository {
  final IRemoteInventoryDataSource dataSource;

  InventoryRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
