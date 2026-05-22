import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../../dashboard_exports.dart';
import '../models/response_models/get_sale_order_summary_by_party/sale_order_summary_by_party.dart';

abstract interface class IRemoteDashboardDataSource {
  Future<DailyStatsModel> getDailyStats({required String date});
  Future<MonthlyStatsModel> getMonthlyStats();
  Future<SaleOrderSummaryByParty> getSalesOrderSummaryByParty();
}

class RemoteDashboardDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteDashboardDataSource {
  RemoteDashboardDataSourceImpl({required super.dioHelper});

  @override
  Future<DailyStatsModel> getDailyStats({required String date}) async {
    return post(
      url: ApiEndPoints.getDailyStats,
      body: {'Date': date},
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
