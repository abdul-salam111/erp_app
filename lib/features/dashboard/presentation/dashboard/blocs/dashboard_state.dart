part of 'dashboard_bloc.dart';

final class DashboardState extends Equatable {
  // ── UI state ──────────────────────────────────────────────────────────────
  final DateTime saleOrderFromDate;
  final DateTime saleOrderToDate;
  final DateTime selectedMonth;
  final DateTime selectedDailyDate;
  final bool     todayOverviewExpanded;
  final String   selectedPanelKey;

  // ── Daily stats ───────────────────────────────────────────────────────────
  final ApiStatus         dailyStatsStatus;
  final DailyStatsEntity? dailyStats;
  final String            dailyStatsError;

  // ── Monthly stats ─────────────────────────────────────────────────────────
  final ApiStatus           monthlyStatsStatus;
  final MonthlyStatsEntity? monthlyStats;
  final String              monthlyStatsError;

  // ── Monthly stats detail (chart) ──────────────────────────────────────────
  final ApiStatus                    monthlyStatsDetailStatus;
  final List<MonthlyStatDetailPoint> monthlyStatsDetail;
  final String                       monthlyStatsDetailError;

  // ── Sale order summary ────────────────────────────────────────────────────
  final ApiStatus               saleOrderSummaryStatus;
  final SaleOrderSummaryEntity? saleOrderSummary;
  final String                  saleOrderSummaryError;

  const DashboardState({
    required this.saleOrderFromDate,
    required this.saleOrderToDate,
    required this.selectedMonth,
    required this.selectedDailyDate,
    required this.todayOverviewExpanded,
    required this.selectedPanelKey,
    required this.dailyStatsStatus,
    this.dailyStats,
    this.dailyStatsError = '',
    required this.monthlyStatsStatus,
    this.monthlyStats,
    this.monthlyStatsError = '',
    required this.monthlyStatsDetailStatus,
    this.monthlyStatsDetail = const [],
    this.monthlyStatsDetailError = '',
    required this.saleOrderSummaryStatus,
    this.saleOrderSummary,
    this.saleOrderSummaryError = '',
  });

  DashboardState copyWith({
    DateTime?                   saleOrderFromDate,
    DateTime?                   saleOrderToDate,
    DateTime?                   selectedMonth,
    DateTime?                   selectedDailyDate,
    bool?                       todayOverviewExpanded,
    String?                     selectedPanelKey,
    ApiStatus?                  dailyStatsStatus,
    DailyStatsEntity?           dailyStats,
    String?                     dailyStatsError,
    ApiStatus?                  monthlyStatsStatus,
    MonthlyStatsEntity?         monthlyStats,
    String?                     monthlyStatsError,
    ApiStatus?                  monthlyStatsDetailStatus,
    List<MonthlyStatDetailPoint>? monthlyStatsDetail,
    String?                     monthlyStatsDetailError,
    ApiStatus?                  saleOrderSummaryStatus,
    SaleOrderSummaryEntity?     saleOrderSummary,
    String?                     saleOrderSummaryError,
  }) {
    return DashboardState(
      saleOrderFromDate:         saleOrderFromDate         ?? this.saleOrderFromDate,
      saleOrderToDate:           saleOrderToDate           ?? this.saleOrderToDate,
      selectedMonth:             selectedMonth             ?? this.selectedMonth,
      selectedDailyDate:         selectedDailyDate         ?? this.selectedDailyDate,
      todayOverviewExpanded:     todayOverviewExpanded     ?? this.todayOverviewExpanded,
      selectedPanelKey:          selectedPanelKey          ?? this.selectedPanelKey,
      dailyStatsStatus:          dailyStatsStatus          ?? this.dailyStatsStatus,
      dailyStats:                dailyStats                ?? this.dailyStats,
      dailyStatsError:           dailyStatsError           ?? this.dailyStatsError,
      monthlyStatsStatus:        monthlyStatsStatus        ?? this.monthlyStatsStatus,
      monthlyStats:              monthlyStats              ?? this.monthlyStats,
      monthlyStatsError:         monthlyStatsError         ?? this.monthlyStatsError,
      monthlyStatsDetailStatus:  monthlyStatsDetailStatus  ?? this.monthlyStatsDetailStatus,
      monthlyStatsDetail:        monthlyStatsDetail        ?? this.monthlyStatsDetail,
      monthlyStatsDetailError:   monthlyStatsDetailError   ?? this.monthlyStatsDetailError,
      saleOrderSummaryStatus:    saleOrderSummaryStatus    ?? this.saleOrderSummaryStatus,
      saleOrderSummary:          saleOrderSummary          ?? this.saleOrderSummary,
      saleOrderSummaryError:     saleOrderSummaryError     ?? this.saleOrderSummaryError,
    );
  }

  @override
  List<Object?> get props => [
    saleOrderFromDate, saleOrderToDate, selectedMonth, selectedDailyDate,
    todayOverviewExpanded, selectedPanelKey,
    dailyStatsStatus, dailyStats, dailyStatsError,
    monthlyStatsStatus, monthlyStats, monthlyStatsError,
    monthlyStatsDetailStatus, monthlyStatsDetail, monthlyStatsDetailError,
    saleOrderSummaryStatus, saleOrderSummary, saleOrderSummaryError,
  ];
}
