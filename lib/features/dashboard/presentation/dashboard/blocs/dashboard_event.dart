part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

final class DashboardDataRequested extends DashboardEvent {
  const DashboardDataRequested();
}

final class SaleOrderFilterChanged extends DashboardEvent {
  final int filterIndex;
  const SaleOrderFilterChanged(this.filterIndex);

  @override
  List<Object> get props => [filterIndex];
}

final class DashboardMonthChanged extends DashboardEvent {
  final DateTime month;
  const DashboardMonthChanged(this.month);

  @override
  List<Object> get props => [month];
}

final class TodayOverviewExpansionToggled extends DashboardEvent {
  const TodayOverviewExpansionToggled();
}
