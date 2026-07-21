import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/daily_stats_entity.dart';
import '../../domain/entities/monthly_stats_detail_entity.dart';
import '../../domain/entities/monthly_stats_entity.dart';
import '../../domain/entities/sale_order_summary_entity.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/remote_dashboard_datasource.dart';
import '../models/response_models/get_daily_stats/daily_stats_model_mapper.dart';
import '../models/response_models/get_monthly_stats/monthly_stats_model_mapper.dart';
import '../models/response_models/get_monthly_stats_detail/monthly_stats_detail_model_mapper.dart';
import '../models/response_models/get_sale_order_summary_by_party/sale_order_summary_mapper.dart';

class DashboardRepositoryImpl extends BaseRepository
    implements DashboardRepository {
  final IRemoteDashboardDataSource dataSource;

  DashboardRepositoryImpl({required this.dataSource});

  @override
  Future<Result<DailyStatsEntity>> getDailyStats({required String date}) {
    return execute(
      call: () async => (await dataSource.getDailyStats(date: date)).toEntity(),
    );
  }

  @override
  Future<Result<MonthlyStatsEntity>> getMonthlyStats({required String date}) {
    return execute(
      call: () async => (await dataSource.getMonthlyStats(date: date)).toEntity(),
    );
  }

  @override
  Future<Result<List<MonthlyStatDetailPoint>>> getMonthlyStatsDetail({
    required String date,
    required String panelKey,
  }) {
    return execute(
      call: () async => (await dataSource.getMonthlyStatsDetail(date: date, panelKey: panelKey))
          .map((m) => m.toEntity())
          .toList(),
    );
  }

  @override
  Future<Result<SaleOrderSummaryEntity>> getSaleOrderSummary({required String fromDate, required String toDate}) {
    return execute(
      call: () async =>
          (await dataSource.getSalesOrderSummaryByParty(fromDate: fromDate, toDate: toDate)).toEntity(),
    );
  }
}
