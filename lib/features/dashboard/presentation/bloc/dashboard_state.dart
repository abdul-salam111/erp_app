part of 'dashboard_bloc.dart';

final class DashboardState extends Equatable {
  final int saleOrderFilterIndex;
  final DateTime selectedMonth;
  final bool showMonthStats;
  final bool todayOverviewExpanded;

  const DashboardState({
    required this.saleOrderFilterIndex,
    required this.selectedMonth,
    required this.showMonthStats,
    required this.todayOverviewExpanded,
  });

  DashboardState copyWith({
    int? saleOrderFilterIndex,
    DateTime? selectedMonth,
    bool? showMonthStats,
    bool? todayOverviewExpanded,
  }) {
    return DashboardState(
      saleOrderFilterIndex: saleOrderFilterIndex ?? this.saleOrderFilterIndex,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      showMonthStats: showMonthStats ?? this.showMonthStats,
      todayOverviewExpanded:
          todayOverviewExpanded ?? this.todayOverviewExpanded,
    );
  }

  @override
  List<Object> get props => [
    saleOrderFilterIndex,
    selectedMonth,
    showMonthStats,
    todayOverviewExpanded,
  ];
}
