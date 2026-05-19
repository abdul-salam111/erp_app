import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/repositories/analytics_repository.dart';
import '../datasources/remote_analytics_datasource.dart';

class AnalyticsRepositoryImpl extends BaseRepository
    implements AnalyticsRepository {
  final IRemoteAnalyticsDataSource dataSource;

  AnalyticsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, dynamic>> performAction() {
    return execute(
      call: () => dataSource.performAction(),
    );
  }
}
