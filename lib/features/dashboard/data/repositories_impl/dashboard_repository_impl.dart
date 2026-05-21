import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/remote_dashboard_datasource.dart';

class DashboardRepositoryImpl extends BaseRepository
    implements DashboardRepository {
  final IRemoteDashboardDataSource dataSource;

  DashboardRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
