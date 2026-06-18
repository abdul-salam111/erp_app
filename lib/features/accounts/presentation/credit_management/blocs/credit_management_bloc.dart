import 'package:bloc/bloc.dart';

import '../../../../../core/shared/shared_exports.dart';
import '../../../accounts_exports.dart';

class CreditManagementBloc extends Bloc<CreditManagementEvent, CreditManagementState>
    with UsecaseExecuterMixin {
  final CreditManagementUsecase creditManagementUsecase;

  CreditManagementBloc({required this.creditManagementUsecase})
      : super(const CreditManagementState()) {
    on<CreditManagementSubmitted>(_onCreditManagementSubmitted);
  }

  Future<void> _onCreditManagementSubmitted(
    CreditManagementSubmitted event,
    Emitter<CreditManagementState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => creditManagementUsecase(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
