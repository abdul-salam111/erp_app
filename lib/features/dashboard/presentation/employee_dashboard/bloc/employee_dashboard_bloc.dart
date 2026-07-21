import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employee_dashboard_event.dart';
part 'employee_dashboard_state.dart';

class EmployeeDashboardBloc extends Bloc<EmployeeDashboardEvent, EmployeeDashboardState> {
  EmployeeDashboardBloc() : super(const EmployeeDashboardState());
}
