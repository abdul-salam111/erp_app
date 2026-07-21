import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mantic_erp_app/core/constants/app_enums.dart';
import '../../../domain/entities/daily_stats_entity.dart';
import '../../../domain/entities/monthly_stats_detail_entity.dart';
import '../../../domain/entities/monthly_stats_entity.dart';
import '../../../domain/entities/sale_order_summary_entity.dart';
import '../../../domain/usecases/get_daily_stats_usecase.dart' show GetDailyStatsUsecase, DailyStatsParams;
import '../../../domain/usecases/get_monthly_stats_detail_usecase.dart';
import '../../../domain/usecases/get_monthly_stats_usecase.dart';
import '../../../domain/usecases/get_sale_order_summary_usecase.dart' show GetSaleOrderSummaryUsecase, SaleOrderSummaryParams;

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDailyStatsUsecase           _getDailyStats;
  final GetMonthlyStatsUsecase         _getMonthlyStats;
  final GetMonthlyStatsDetailUsecase   _getMonthlyStatsDetail;
  final GetSaleOrderSummaryUsecase     _getSaleOrderSummary;

  DashboardBloc({
    required GetDailyStatsUsecase          getDailyStats,
    required GetMonthlyStatsUsecase        getMonthlyStats,
    required GetMonthlyStatsDetailUsecase  getMonthlyStatsDetail,
    required GetSaleOrderSummaryUsecase    getSaleOrderSummary,
  })  : _getDailyStats          = getDailyStats,
        _getMonthlyStats        = getMonthlyStats,
        _getMonthlyStatsDetail  = getMonthlyStatsDetail,
        _getSaleOrderSummary    = getSaleOrderSummary,
        super(DashboardState(
          saleOrderFromDate:        DateTime.now().subtract(const Duration(days: 30)),
          saleOrderToDate:          DateTime.now(),
          selectedMonth:            DateTime(DateTime.now().year, DateTime.now().month),
          selectedDailyDate:        DateTime.now(),
          todayOverviewExpanded:    false,
          selectedPanelKey:         'revenue',
          dailyStatsStatus:         ApiStatus.INITIAL,
          monthlyStatsStatus:       ApiStatus.INITIAL,
          monthlyStatsDetailStatus: ApiStatus.INITIAL,
          saleOrderSummaryStatus:   ApiStatus.INITIAL,
        )) {
    on<DashboardDataRequested>(_onDashboardDataRequested);
    on<SaleOrderDateRangeChanged>(_onSaleOrderDateRangeChanged);
    on<DashboardMonthChanged>(_onDashboardMonthChanged);
    on<TodayOverviewExpansionToggled>(_onTodayOverviewExpansionToggled);
    on<DailyStatsDateChanged>(_onDailyStatsDateChanged);
    on<MonthlyStatsDetailKeyChanged>(_onMonthlyStatsDetailKeyChanged);
  }

  static String _toDateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  static String _toMonthDateStr(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-01';

  Future<void> _onDashboardDataRequested(
    DashboardDataRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(
      dailyStatsStatus:         ApiStatus.LOADING,
      monthlyStatsStatus:       ApiStatus.LOADING,
      monthlyStatsDetailStatus: ApiStatus.LOADING,
      saleOrderSummaryStatus:   ApiStatus.LOADING,
    ));

    final dailyDateStr  = _toDateStr(state.selectedDailyDate);
    final monthDateStr  = _toMonthDateStr(state.selectedMonth);

    final (dailyResult, monthlyResult, detailResult, saleOrderResult) = await (
      _getDailyStats(DailyStatsParams(date: dailyDateStr)),
      _getMonthlyStats(MonthlyStatsParams(date: monthDateStr)),
      _getMonthlyStatsDetail(MonthlyStatsDetailParams(date: monthDateStr, panelKey: state.selectedPanelKey)),
      _getSaleOrderSummary(SaleOrderSummaryParams(
        fromDate: _toDateStr(state.saleOrderFromDate),
        toDate:   _toDateStr(state.saleOrderToDate),
      )),
    ).wait;

    dailyResult.when(
      failure: (f) => emit(state.copyWith(dailyStatsStatus: ApiStatus.FAILURE, dailyStatsError: f.message)),
      success: (d) => emit(state.copyWith(dailyStatsStatus: ApiStatus.SUCCESS, dailyStats: d)),
    );

    monthlyResult.when(
      failure: (f) => emit(state.copyWith(monthlyStatsStatus: ApiStatus.FAILURE, monthlyStatsError: f.message)),
      success: (d) => emit(state.copyWith(monthlyStatsStatus: ApiStatus.SUCCESS, monthlyStats: d)),
    );

    detailResult.when(
      failure: (f) => emit(state.copyWith(monthlyStatsDetailStatus: ApiStatus.FAILURE, monthlyStatsDetailError: f.message)),
      success: (d) => emit(state.copyWith(monthlyStatsDetailStatus: ApiStatus.SUCCESS, monthlyStatsDetail: d)),
    );

    saleOrderResult.when(
      failure: (f) => emit(state.copyWith(saleOrderSummaryStatus: ApiStatus.FAILURE, saleOrderSummaryError: f.message)),
      success: (d) => emit(state.copyWith(saleOrderSummaryStatus: ApiStatus.SUCCESS, saleOrderSummary: d)),
    );
  }

  Future<void> _onSaleOrderDateRangeChanged(
    SaleOrderDateRangeChanged event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(
      saleOrderFromDate:     event.fromDate,
      saleOrderToDate:       event.toDate,
      saleOrderSummaryStatus: ApiStatus.LOADING,
    ));
    final result = await _getSaleOrderSummary(SaleOrderSummaryParams(
      fromDate: _toDateStr(event.fromDate),
      toDate:   _toDateStr(event.toDate),
    ));
    result.when(
      failure: (f) => emit(state.copyWith(saleOrderSummaryStatus: ApiStatus.FAILURE, saleOrderSummaryError: f.message)),
      success: (d) => emit(state.copyWith(saleOrderSummaryStatus: ApiStatus.SUCCESS, saleOrderSummary: d)),
    );
  }

  Future<void> _onDashboardMonthChanged(
    DashboardMonthChanged event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(
      selectedMonth:            event.month,
      monthlyStatsStatus:       ApiStatus.LOADING,
      monthlyStatsDetailStatus: ApiStatus.LOADING,
    ));

    final dateStr = _toMonthDateStr(event.month);

    final (monthlyResult, detailResult) = await (
      _getMonthlyStats(MonthlyStatsParams(date: dateStr)),
      _getMonthlyStatsDetail(MonthlyStatsDetailParams(date: dateStr, panelKey: state.selectedPanelKey)),
    ).wait;

    monthlyResult.when(
      failure: (f) => emit(state.copyWith(monthlyStatsStatus: ApiStatus.FAILURE, monthlyStatsError: f.message)),
      success: (d) => emit(state.copyWith(monthlyStatsStatus: ApiStatus.SUCCESS, monthlyStats: d)),
    );

    detailResult.when(
      failure: (f) => emit(state.copyWith(monthlyStatsDetailStatus: ApiStatus.FAILURE, monthlyStatsDetailError: f.message)),
      success: (d) => emit(state.copyWith(monthlyStatsDetailStatus: ApiStatus.SUCCESS, monthlyStatsDetail: d)),
    );
  }

  void _onTodayOverviewExpansionToggled(
    TodayOverviewExpansionToggled event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(todayOverviewExpanded: !state.todayOverviewExpanded));
  }

  Future<void> _onDailyStatsDateChanged(
    DailyStatsDateChanged event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(
      selectedDailyDate: event.date,
      dailyStatsStatus:  ApiStatus.LOADING,
    ));

    final result = await _getDailyStats(DailyStatsParams(date: _toDateStr(event.date)));
    result.when(
      failure: (f) => emit(state.copyWith(dailyStatsStatus: ApiStatus.FAILURE, dailyStatsError: f.message)),
      success: (d) => emit(state.copyWith(dailyStatsStatus: ApiStatus.SUCCESS, dailyStats: d)),
    );
  }

  Future<void> _onMonthlyStatsDetailKeyChanged(
    MonthlyStatsDetailKeyChanged event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(
      selectedPanelKey:         event.panelKey,
      monthlyStatsDetailStatus: ApiStatus.LOADING,
    ));

    final dateStr = _toMonthDateStr(state.selectedMonth);
    final result  = await _getMonthlyStatsDetail(
      MonthlyStatsDetailParams(date: dateStr, panelKey: event.panelKey),
    );

    result.when(
      failure: (f) => emit(state.copyWith(monthlyStatsDetailStatus: ApiStatus.FAILURE, monthlyStatsDetailError: f.message)),
      success: (d) => emit(state.copyWith(monthlyStatsDetailStatus: ApiStatus.SUCCESS, monthlyStatsDetail: d)),
    );
  }
}
