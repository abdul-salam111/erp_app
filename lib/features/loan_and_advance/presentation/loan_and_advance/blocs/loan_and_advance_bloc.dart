import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/loan_and_advance_usecase.dart';
import 'loan_and_advance_event.dart';
import 'loan_and_advance_state.dart';

class LoanAndAdvanceBloc extends Bloc<LoanAndAdvanceEvent, LoanAndAdvanceState>
    with UsecaseExecuterMixin {
  final LoanAndAdvanceUsecase loanAndAdvanceUsecase;

  LoanAndAdvanceBloc({required this.loanAndAdvanceUsecase})
      : super(LoanAndAdvanceState()) {
    on<LoanAndAdvanceFetched>(_onFetched);
  }

  Future<void> _onFetched(
    LoanAndAdvanceFetched event,
    Emitter<LoanAndAdvanceState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => loanAndAdvanceUsecase.call(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
