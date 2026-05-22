import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../../dashboard_exports.dart';

abstract interface class IRemoteDashboardDataSource {
  Future<DailyStatsModel> getDailyStats();
  Future<MonthlyStatsModel> getMonthlyStats();
  Future<SaleOrderSummaryByParty> getSalesOrderSummaryByParty();
}

class RemoteDashboardDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteDashboardDataSource {
  RemoteDashboardDataSourceImpl({required super.dioHelper});

  @override
  Future<DailyStatsModel> getDailyStats() async {
    return get(
      url: ApiEndPoints.getDailyStats,
      parser: (json) => DailyStatsModel.fromJson(json),
    );
  }

  @override
  Future<MonthlyStatsModel> getMonthlyStats() async {
    return get(
      url: ApiEndPoints.getMonthlyStats,
      parser: (json) => MonthlyStatsModel.fromJson(json),
    );
  }

  @override
  Future<SaleOrderSummaryByParty> getSalesOrderSummaryByParty() async {
    return get(
      url: ApiEndPoints.getSalesOrderSummaryByParty,
      parser: (json) => SaleOrderSummaryByParty.fromJson(json),
    );
  }
}
