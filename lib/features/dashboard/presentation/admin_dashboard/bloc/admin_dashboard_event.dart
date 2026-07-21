part of 'admin_dashboard_bloc.dart';

sealed class AdminDashboardEvent extends Equatable {
  const AdminDashboardEvent();

  @override
  List<Object> get props => [];
}

final class DashboardDataRequested extends AdminDashboardEvent {
  const DashboardDataRequested();
}

final class SaleOrderDateRangeChanged extends AdminDashboardEvent {
  final DateTime fromDate;
  final DateTime toDate;
  const SaleOrderDateRangeChanged({required this.fromDate, required this.toDate});

  @override
  List<Object> get props => [fromDate, toDate];
}

final class DashboardMonthChanged extends AdminDashboardEvent {
  final DateTime month;
  const DashboardMonthChanged(this.month);

  @override
  List<Object> get props => [month];
}

final class TodayOverviewExpansionToggled extends AdminDashboardEvent {
  const TodayOverviewExpansionToggled();
}

final class DailyStatsDateChanged extends AdminDashboardEvent {
  final DateTime date;
  const DailyStatsDateChanged(this.date);

  @override
  List<Object> get props => [date];
}

final class MonthlyStatsDetailKeyChanged extends AdminDashboardEvent {
  final String panelKey;
  const MonthlyStatsDetailKeyChanged(this.panelKey);

  @override
  List<Object> get props => [panelKey];
}
