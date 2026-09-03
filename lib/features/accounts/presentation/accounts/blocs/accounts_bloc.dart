import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/constants/const_exports.dart';

import '../../../domain/usecases/accounts/get_due_receipt_count_usecase.dart';
import 'accounts_event.dart';
import 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState>
    with UsecaseExecuterMixin {
  final GetDueReceiptCountUsecase getDueReceiptCountUsecase;

  AccountsBloc({required this.getDueReceiptCountUsecase})
    : super(const AccountsState(todayOverviewExpanded: false)) {
    on<TodayOverviewExpansionToggled>(_onTodayOverviewExpansionToggled);
    on<RecoveryFilterChanged>(_onRecoveryFilterChanged, transformer: sequential());
    on<RecoveryDueFetched>(_onRecoveryDueFetched, transformer: restartable());
    on<RecoveryPageChanged>(_onRecoveryPageChanged, transformer: sequential());
    on<RecoverySearchChanged>(_onRecoverySearchChanged);
    add(const RecoveryDueFetched());
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
    emit(state.copyWith(selectedFilter: event.filter, currentPage: 0));
    add(RecoveryDueFetched(filter: event.filter));
  }

  void _onRecoveryPageChanged(
    RecoveryPageChanged event,
    Emitter<AccountsState> emit,
  ) {
    emit(state.copyWith(currentPage: event.page));
  }

  void _onRecoverySearchChanged(
    RecoverySearchChanged event,
    Emitter<AccountsState> emit,
  ) {
    emit(state.copyWith(searchQuery: event.query, currentPage: 0));
  }

  Future<void> _onRecoveryDueFetched(
    RecoveryDueFetched event,
    Emitter<AccountsState> emit,
  ) async {
    emit(state.copyWith(recoveryDueStatus: ApiStatus.LOADING));
    final dateType = switch (event.filter) {
      FilterType.today  => 'today',
      FilterType.week   => 'week',
      FilterType.month  => 'month',
      FilterType.oldest => 'oldest',
    };
    final result = await getDueReceiptCountUsecase.call(
      GetDueReceiptCountParams(dateType: dateType),
    );
    result.when(
      failure: (failure) => emit(
        state.copyWith(
          recoveryDueStatus: ApiStatus.FAILURE,
          recoveryDueError: failure.message,
        ),
      ),
      success: (data) => emit(
        state.copyWith(recoveryDueStatus: ApiStatus.SUCCESS, recoveryDue: data),
      ),
    );
  }
}
