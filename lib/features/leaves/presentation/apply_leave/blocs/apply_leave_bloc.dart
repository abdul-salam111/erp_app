import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/apply_leave_usecase.dart';
import 'apply_leave_event.dart';
import 'apply_leave_state.dart';

class ApplyLeaveBloc extends Bloc<ApplyLeaveEvent, ApplyLeaveState>
    with UsecaseExecuterMixin {
  final ApplyLeaveUsecase applyLeaveUsecase;

  ApplyLeaveBloc({required this.applyLeaveUsecase})
      : super(const ApplyLeaveState()) {
    on<ApplyLeaveSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    ApplyLeaveSubmitted event,
    Emitter<ApplyLeaveState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => applyLeaveUsecase.call(
        ApplyLeaveParams(
          fromDate: event.fromDate,
          toDate: event.toDate,
          leavePolicyId: event.leavePolicyId,
          reason: event.reason,
          attachmentFileIds: event.attachmentFileIds,
        ),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
