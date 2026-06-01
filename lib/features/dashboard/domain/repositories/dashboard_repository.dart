import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/daily_stats_entity.dart';
import '../entities/monthly_stats_detail_entity.dart';
import '../entities/monthly_stats_entity.dart';
import '../entities/sale_order_summary_entity.dart';

abstract interface class DashboardRepository {
  Future<Either<Failure, DailyStatsEntity>>              getDailyStats({required String date});
  Future<Either<Failure, MonthlyStatsEntity>>            getMonthlyStats({required String date});
  Future<Either<Failure, List<MonthlyStatDetailPoint>>>  getMonthlyStatsDetail({required String date, required String panelKey});
  Future<Either<Failure, SaleOrderSummaryEntity>>        getSaleOrderSummary();
}
