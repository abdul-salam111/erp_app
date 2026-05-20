import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/accounts_usecase.dart';
import 'accounts_event.dart';
import 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState>
    with UsecaseExecuterMixin {
  final AccountsUsecase accountsUsecase;

  AccountsBloc({required this.accountsUsecase})
    : super(const AccountsState(todayOverviewExpanded: false)) {
    on<AccountsSubmitted>(_onAccountsSubmitted);
    on<TodayOverviewExpansionToggled>(_onTodayOverviewExpansionToggled);
    on<RecoveryFilterChanged>(_onRecoveryFilterChanged);
  }

  Future<void> _onAccountsSubmitted(
    AccountsSubmitted event,
    Emitter<AccountsState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => accountsUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }

  void _onTodayOverviewExpansionToggled(
    TodayOverviewExpansionToggled event,
    Emitter<AccountsState> emit,
  ) {
    emit(state.copyWith(todayOverviewExpanded: !state.todayOverviewExpanded));
  }

  void _onRecoveryFilterChanged(
    RecoveryFilterChanged event,
    Emitter<AccountsState> emit,
  ) {
    if (state.selectedFilter == event.filter) return;
    emit(state.copyWith(selectedFilter: event.filter));
  }
}
