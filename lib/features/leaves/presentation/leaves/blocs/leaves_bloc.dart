import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../../../features/leaves/domain/usecases/leaves_usecase.dart';
import 'leaves_event.dart';
import 'leaves_state.dart';

class LeavesBloc extends Bloc<LeavesEvent, LeavesState>
    with UsecaseExecuterMixin {
  final LeavesUsecase leavesUsecase;

  LeavesBloc({required this.leavesUsecase}) : super(const LeavesState()) {
    on<LeavesSubmitted>(_onLeavesSubmitted);
  }

  Future<void> _onLeavesSubmitted(
    LeavesSubmitted event,
    Emitter<LeavesState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => leavesUsecase.call(NoParams()),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
