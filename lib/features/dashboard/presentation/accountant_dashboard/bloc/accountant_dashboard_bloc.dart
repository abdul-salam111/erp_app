import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'accountant_dashboard_event.dart';
part 'accountant_dashboard_state.dart';

class AccountantDashboardBloc extends Bloc<AccountantDashboardEvent, AccountantDashboardState> {
  AccountantDashboardBloc() : super(const AccountantDashboardState());
}
