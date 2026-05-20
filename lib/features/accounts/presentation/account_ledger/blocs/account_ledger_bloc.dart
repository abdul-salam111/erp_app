import 'package:bloc/bloc.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class AccountLedgerBloc extends Bloc<AccountLedgerEvent, AccountLedgerState>
    with UsecaseExecuterMixin {
  final AccountLedgerUsecase accountLedgerUsecase;

  AccountLedgerBloc({required this.accountLedgerUsecase})
      : super(const AccountLedgerState()) {
    on<AccountLedgerSubmitted>(_onAccountLedgerSubmitted);
  }

  Future<void> _onAccountLedgerSubmitted(
    AccountLedgerSubmitted event,
    Emitter<AccountLedgerState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => accountLedgerUsecase(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
