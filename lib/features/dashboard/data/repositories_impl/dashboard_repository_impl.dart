import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/daily_stats_entity.dart';
import '../../domain/entities/monthly_stats_entity.dart';
import '../../domain/entities/sale_order_summary_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/remote_dashboard_datasource.dart';
import '../models/response_models/get_daily_stats/daily_stats_model_mapper.dart';
import '../models/response_models/get_monthly_stats/monthly_stats_model_mapper.dart';
import '../models/response_models/get_sale_order_summary_by_party/sale_order_summary_mapper.dart';

class DashboardRepositoryImpl extends BaseRepository
    implements DashboardRepository {
  final IRemoteDashboardDataSource dataSource;

  DashboardRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, DailyStatsEntity>> getDailyStats() {
    return execute(
      call: () async => (await dataSource.getDailyStats()).toEntity(),
    );
  }

  @override
  Future<Either<Failure, MonthlyStatsEntity>> getMonthlyStats() {
    return execute(
      call: () async => (await dataSource.getMonthlyStats()).toEntity(),
    );
  }

  @override
  Future<Either<Failure, SaleOrderSummaryEntity>> getSaleOrderSummary() {
    return execute(
      call: () async =>
          (await dataSource.getSalesOrderSummaryByParty()).toEntity(),
    );
  }
}
