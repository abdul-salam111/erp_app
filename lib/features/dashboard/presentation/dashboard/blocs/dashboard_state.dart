part of 'dashboard_bloc.dart';

final class DashboardState extends Equatable {
  // ── UI state ──────────────────────────────────────────────────────────────
  final int      saleOrderFilterIndex;
  final DateTime selectedMonth;
  final bool     todayOverviewExpanded;

  // ── Daily stats ───────────────────────────────────────────────────────────
  final ApiStatus         dailyStatsStatus;
  final DailyStatsEntity? dailyStats;
  final String            dailyStatsError;

  // ── Monthly stats ─────────────────────────────────────────────────────────
  final ApiStatus           monthlyStatsStatus;
  final MonthlyStatsEntity? monthlyStats;
  final String              monthlyStatsError;

  // ── Sale order summary ────────────────────────────────────────────────────
  final ApiStatus               saleOrderSummaryStatus;
  final SaleOrderSummaryEntity? saleOrderSummary;
  final String                  saleOrderSummaryError;

  const DashboardState({
    required this.saleOrderFilterIndex,
    required this.selectedMonth,
    required this.todayOverviewExpanded,
    required this.dailyStatsStatus,
    this.dailyStats,
    this.dailyStatsError = '',
    required this.monthlyStatsStatus,
    this.monthlyStats,
    this.monthlyStatsError = '',
    required this.saleOrderSummaryStatus,
    this.saleOrderSummary,
    this.saleOrderSummaryError = '',
  });

  DashboardState copyWith({
    int?                   saleOrderFilterIndex,
    DateTime?              selectedMonth,
    bool?                  todayOverviewExpanded,
    ApiStatus?             dailyStatsStatus,
    DailyStatsEntity?      dailyStats,
    String?                dailyStatsError,
    ApiStatus?             monthlyStatsStatus,
    MonthlyStatsEntity?    monthlyStats,
    String?                monthlyStatsError,
    ApiStatus?             saleOrderSummaryStatus,
    SaleOrderSummaryEntity? saleOrderSummary,
    String?                saleOrderSummaryError,
  }) {
    return DashboardState(
      saleOrderFilterIndex:   saleOrderFilterIndex   ?? this.saleOrderFilterIndex,
      selectedMonth:          selectedMonth          ?? this.selectedMonth,
      todayOverviewExpanded:  todayOverviewExpanded  ?? this.todayOverviewExpanded,
      dailyStatsStatus:       dailyStatsStatus       ?? this.dailyStatsStatus,
      dailyStats:             dailyStats             ?? this.dailyStats,
      dailyStatsError:        dailyStatsError        ?? this.dailyStatsError,
      monthlyStatsStatus:     monthlyStatsStatus     ?? this.monthlyStatsStatus,
      monthlyStats:           monthlyStats           ?? this.monthlyStats,
      monthlyStatsError:      monthlyStatsError      ?? this.monthlyStatsError,
      saleOrderSummaryStatus: saleOrderSummaryStatus ?? this.saleOrderSummaryStatus,
      saleOrderSummary:       saleOrderSummary       ?? this.saleOrderSummary,
      saleOrderSummaryError:  saleOrderSummaryError  ?? this.saleOrderSummaryError,
    );
  }

  @override
  List<Object?> get props => [
    saleOrderFilterIndex, selectedMonth, todayOverviewExpanded,
    dailyStatsStatus, dailyStats, dailyStatsError,
    monthlyStatsStatus, monthlyStats, monthlyStatsError,
    saleOrderSummaryStatus, saleOrderSummary, saleOrderSummaryError,
  ];
}
