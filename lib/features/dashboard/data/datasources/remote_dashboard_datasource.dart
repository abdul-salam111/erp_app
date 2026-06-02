import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/session_manager.dart';
import '../../dashboard_exports.dart';
import '../models/response_models/get_monthly_stats_detail/monthly_stats_detail_model.dart';
import '../models/response_models/get_sale_order_summary_by_party/sale_order_summary_by_party.dart';

abstract interface class IRemoteDashboardDataSource {
  Future<DailyStatsModel> getDailyStats({required String date});
  Future<MonthlyStatsModel> getMonthlyStats({required String date});
  Future<List<MonthlyStatDetailModel>> getMonthlyStatsDetail({required String date, required String panelKey});
  Future<SaleOrderSummaryByParty> getSalesOrderSummaryByParty({required String fromDate, required String toDate});
}

class RemoteDashboardDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteDashboardDataSource {
  RemoteDashboardDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<DailyStatsModel> getDailyStats({required String date}) async {
    return post(
      url:      ApiEndPoints.getDailyStats,
      body:     {'Date': date},
      parser:   (json) => DailyStatsModel.fromJson(json),
      authToken: _token,
    );
  }

  @override
  Future<MonthlyStatsModel> getMonthlyStats({required String date}) async {
    return post(
      url:      ApiEndPoints.getMonthlyStats,
      body:     {'Date': date},
      parser:   (json) => MonthlyStatsModel.fromJson(json),
      authToken: _token,
    );
  }

  @override
  Future<List<MonthlyStatDetailModel>> getMonthlyStatsDetail({
    required String date,
    required String panelKey,
  }) async {
    return postList(
      url:      ApiEndPoints.getMonthlyStatsDetail,
      body:     {'Date': date, 'PanelKey': panelKey},
      parser:   (json) => MonthlyStatDetailModel.fromJson(json),
      authToken: _token,
    );
  }

  @override
  Future<SaleOrderSummaryByParty> getSalesOrderSummaryByParty({required String fromDate, required String toDate}) async {
    return post(
      url:      ApiEndPoints.getSalesOrderSummaryByParty,
      body:     {'FromDate': fromDate, 'ToDate': toDate},
      parser:   (json) => SaleOrderSummaryByParty.fromJson(json),
      authToken: _token,
    );
  }
}
