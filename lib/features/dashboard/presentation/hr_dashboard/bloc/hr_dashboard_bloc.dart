import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'hr_dashboard_event.dart';
part 'hr_dashboard_state.dart';

class HrDashboardBloc extends Bloc<HrDashboardEvent, HrDashboardState> {
  HrDashboardBloc() : super(const HrDashboardState());
}
