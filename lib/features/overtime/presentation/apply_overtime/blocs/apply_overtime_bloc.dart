import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/apply_overtime_usecase.dart';
import 'apply_overtime_event.dart';
import 'apply_overtime_state.dart';

class ApplyOvertimeBloc extends Bloc<ApplyOvertimeEvent, ApplyOvertimeState>
    with UsecaseExecuterMixin {
  final ApplyOvertimeUsecase applyOvertimeUsecase;

  ApplyOvertimeBloc({required this.applyOvertimeUsecase})
      : super(const ApplyOvertimeState()) {
    on<ApplyOvertimeSubmitted>(_onSubmitted, transformer: droppable());
  }

  Future<void> _onSubmitted(
    ApplyOvertimeSubmitted event,
    Emitter<ApplyOvertimeState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => applyOvertimeUsecase(ApplyOvertimeParams(
        date: event.date,
        hours: event.hours,
        overtimeType: event.overtimeType,
        reason: event.reason,
      )),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
