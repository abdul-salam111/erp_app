import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/production_repository.dart';
import '../datasources/remote_production_datasource.dart';

class ProductionRepositoryImpl extends BaseRepository
    implements ProductionRepository {
  final IRemoteProductionDataSource dataSource;

  ProductionRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
