import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/usecases/accounts_usecase.dart';
import '../../../domain/usecases/get_due_receipt_count_usecase.dart';
import 'accounts_event.dart';
import 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState>
    with UsecaseExecuterMixin {
  final AccountsUsecase          accountsUsecase;
  final GetDueReceiptCountUsecase getDueReceiptCountUsecase;

  AccountsBloc({
    required this.accountsUsecase,
    required this.getDueReceiptCountUsecase,
  }) : super(const AccountsState(todayOverviewExpanded: false)) {
    on<AccountsSubmitted>(_onAccountsSubmitted);
    on<TodayOverviewExpansionToggled>(_onTodayOverviewExpansionToggled);
    on<RecoveryFilterChanged>(_onRecoveryFilterChanged);
    on<RecoveryDueFetched>(_onRecoveryDueFetched);

    add(const RecoveryDueFetched());
  }

  Future<void> _onAccountsSubmitted(
    AccountsSubmitted event,
    Emitter<AccountsState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => accountsUsecase.call(NoParams()),
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
    add(RecoveryDueFetched(filter: event.filter));
  }

  Future<void> _onRecoveryDueFetched(
    RecoveryDueFetched event,
    Emitter<AccountsState> emit,
  ) async {
    emit(state.copyWith(recoveryDueStatus: ApiStatus.LOADING));
    final dateType = event.filter == FilterType.today ? 'today' : 'oldest';
    final result = await getDueReceiptCountUsecase.call(
      GetDueReceiptCountParams(dateType: dateType),
    );
    result.fold(
      (failure) => emit(state.copyWith(
        recoveryDueStatus: ApiStatus.FAILURE,
        recoveryDueError:  failure.message,
      )),
      (data) => emit(state.copyWith(
        recoveryDueStatus: ApiStatus.SUCCESS,
        recoveryDue:       data,
      )),
    );
  }
}
