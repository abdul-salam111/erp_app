import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mantic_erp_app/core/constants/app_enums.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/entities/daily_stats_entity.dart';
import '../../../domain/entities/monthly_stats_entity.dart';
import '../../../domain/entities/sale_order_summary_entity.dart';
import '../../../domain/usecases/get_daily_stats_usecase.dart';
import '../../../domain/usecases/get_monthly_stats_usecase.dart';
import '../../../domain/usecases/get_sale_order_summary_usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDailyStatsUsecase      _getDailyStats;
  final GetMonthlyStatsUsecase    _getMonthlyStats;
  final GetSaleOrderSummaryUsecase _getSaleOrderSummary;

  DashboardBloc({
    required GetDailyStatsUsecase      getDailyStats,
    required GetMonthlyStatsUsecase    getMonthlyStats,
    required GetSaleOrderSummaryUsecase getSaleOrderSummary,
  })  : _getDailyStats       = getDailyStats,
        _getMonthlyStats     = getMonthlyStats,
        _getSaleOrderSummary = getSaleOrderSummary,
        super(DashboardState(
          saleOrderFilterIndex:   0,
          selectedMonth:          DateTime(DateTime.now().year, DateTime.now().month),
          todayOverviewExpanded:  false,
          dailyStatsStatus:       ApiStatus.INITIAL,
          monthlyStatsStatus:     ApiStatus.INITIAL,
          saleOrderSummaryStatus: ApiStatus.INITIAL,
        )) {
    on<DashboardDataRequested>(_onDashboardDataRequested);
    on<SaleOrderFilterChanged>(_onSaleOrderFilterChanged);
    on<DashboardMonthChanged>(_onDashboardMonthChanged);
    on<TodayOverviewExpansionToggled>(_onTodayOverviewExpansionToggled);
  }

  Future<void> _onDashboardDataRequested(
    DashboardDataRequested event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(
      dailyStatsStatus:       ApiStatus.LOADING,
      monthlyStatsStatus:     ApiStatus.LOADING,
      saleOrderSummaryStatus: ApiStatus.LOADING,
    ));

    final (dailyResult, monthlyResult, saleOrderResult) = await (
      _getDailyStats(NoParams()),
      _getMonthlyStats(NoParams()),
      _getSaleOrderSummary(NoParams()),
    ).wait;

    dailyResult.fold(
      (f) => emit(state.copyWith(
        dailyStatsStatus: ApiStatus.FAILURE,
        dailyStatsError:  f.message,
      )),
      (data) => emit(state.copyWith(
        dailyStatsStatus: ApiStatus.SUCCESS,
        dailyStats:       data,
      )),
    );

    monthlyResult.fold(
      (f) => emit(state.copyWith(
        monthlyStatsStatus: ApiStatus.FAILURE,
        monthlyStatsError:  f.message,
      )),
      (data) => emit(state.copyWith(
        monthlyStatsStatus: ApiStatus.SUCCESS,
        monthlyStats:       data,
      )),
    );

    saleOrderResult.fold(
      (f) => emit(state.copyWith(
        saleOrderSummaryStatus: ApiStatus.FAILURE,
        saleOrderSummaryError:  f.message,
      )),
      (data) => emit(state.copyWith(
        saleOrderSummaryStatus: ApiStatus.SUCCESS,
        saleOrderSummary:       data,
      )),
    );
  }

  void _onSaleOrderFilterChanged(
    SaleOrderFilterChanged event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(saleOrderFilterIndex: event.filterIndex));
  }

  void _onDashboardMonthChanged(
    DashboardMonthChanged event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(selectedMonth: event.month));
  }

  void _onTodayOverviewExpansionToggled(
    TodayOverviewExpansionToggled event,
    Emitter<DashboardState> emit,
  ) {
    emit(state.copyWith(todayOverviewExpanded: !state.todayOverviewExpanded));
  }
}
