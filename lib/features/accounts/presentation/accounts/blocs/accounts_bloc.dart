import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/accounts_usecase.dart';
import 'accounts_event.dart';
import 'accounts_state.dart';

class AccountsBloc extends Bloc<AccountsEvent, AccountsState>
    with UsecaseExecuterMixin {
  final AccountsUsecase accountsUsecase;

  AccountsBloc({required this.accountsUsecase})
      : super(const AccountsState()) {
    on<AccountsSubmitted>(_onAccountsSubmitted);
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
}
