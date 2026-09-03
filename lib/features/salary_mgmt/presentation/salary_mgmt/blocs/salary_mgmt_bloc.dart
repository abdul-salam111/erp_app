import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/salary_mgmt_usecase.dart';
import 'salary_mgmt_event.dart';
import 'salary_mgmt_state.dart';

class SalaryMgmtBloc extends Bloc<SalaryMgmtEvent, SalaryMgmtState>
    with UsecaseExecuterMixin {
  final SalaryMgmtUsecase salarymgmtUsecase;

  SalaryMgmtBloc({required this.salarymgmtUsecase})
      : super(SalaryMgmtState()) {
    on<SalaryMgmtSubmitted>(_onSalaryMgmtSubmitted, transformer: droppable());
  }

  Future<void> _onSalaryMgmtSubmitted(
    SalaryMgmtSubmitted event,
    Emitter<SalaryMgmtState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => salarymgmtUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
