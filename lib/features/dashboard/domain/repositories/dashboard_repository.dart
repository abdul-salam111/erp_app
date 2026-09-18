import '../../../../core/utils/result.dart';
import '../entities/daily_stats_entity.dart';
import '../entities/monthly_stats_detail_entity.dart';
import '../entities/monthly_stats_entity.dart';
import '../entities/sale_order_summary_entity.dart';

abstract interface class DashboardRepository {
  Future<Result<DailyStatsEntity>>              getDailyStats({required String date});
  Future<Result<MonthlyStatsEntity>>            getMonthlyStats({required String date});
  Future<Result<List<MonthlyStatDetailPoint>>>  getMonthlyStatsDetail({required String date, required String panelKey});
  Future<Result<SaleOrderSummaryEntity>>        getSaleOrderSummary({required String fromDate, required String toDate});
}
