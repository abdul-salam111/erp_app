import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../datasources/remote_analytics_datasource.dart';

class AnalyticsRepositoryImpl extends BaseRepository
    implements AnalyticsRepository {
  final IRemoteAnalyticsDataSource dataSource;

  AnalyticsRepositoryImpl({required this.dataSource});

  @override
  Future<Result<dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
