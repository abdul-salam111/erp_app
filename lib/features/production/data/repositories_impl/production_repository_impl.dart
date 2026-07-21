import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/repositories/production_repository.dart';
import '../datasources/remote_production_datasource.dart';

class ProductionRepositoryImpl extends BaseRepository
    implements ProductionRepository {
  final IRemoteProductionDataSource dataSource;

  ProductionRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
