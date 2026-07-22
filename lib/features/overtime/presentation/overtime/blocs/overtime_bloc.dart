import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/overtime_usecase.dart';
import 'overtime_event.dart';
import 'overtime_state.dart';

class OvertimeBloc extends Bloc<OvertimeEvent, OvertimeState>
    with UsecaseExecuterMixin {
  final OvertimeUsecase overtimeUsecase;

  OvertimeBloc({required this.overtimeUsecase})
      : super(const OvertimeState()) {
    on<OvertimeSubmitted>(_onOvertimeSubmitted);
  }

  Future<void> _onOvertimeSubmitted(
    OvertimeSubmitted event,
    Emitter<OvertimeState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => overtimeUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
