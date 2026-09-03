import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/apply_loan_usecase.dart';
import 'apply_loan_event.dart';
import 'apply_loan_state.dart';

class ApplyLoanBloc extends Bloc<ApplyLoanEvent, ApplyLoanState>
    with UsecaseExecuterMixin {
  final ApplyLoanUsecase applyLoanUsecase;

  ApplyLoanBloc({required this.applyLoanUsecase})
      : super(const ApplyLoanState()) {
    on<ApplyLoanSubmitted>(_onSubmitted, transformer: droppable());
  }

  Future<void> _onSubmitted(
    ApplyLoanSubmitted event,
    Emitter<ApplyLoanState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => applyLoanUsecase(ApplyLoanParams(
        loanType: event.loanType,
        amount: event.amount,
        tenureMonths: event.tenureMonths,
        reason: event.reason,
      )),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
