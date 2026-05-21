import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc()
      : super(DashboardState(
          saleOrderFilterIndex:  0,
          selectedMonth:         DateTime(DateTime.now().year, DateTime.now().month),
          todayOverviewExpanded: false,
        )) {
    on<SaleOrderFilterChanged>(_onSaleOrderFilterChanged);
    on<DashboardMonthChanged>(_onDashboardMonthChanged);
    on<TodayOverviewExpansionToggled>(_onTodayOverviewExpansionToggled);
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
