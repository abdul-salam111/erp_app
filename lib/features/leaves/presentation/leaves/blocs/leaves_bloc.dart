import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/leaves_usecase.dart';
import '../models/leave_request_model.dart';
import 'leaves_event.dart';
import 'leaves_state.dart';

class LeavesBloc extends Bloc<LeavesEvent, LeavesState>
    with UsecaseExecuterMixin {
  final LeavesUsecase leavesUsecase;

  LeavesBloc({required this.leavesUsecase})
      : super(LeavesState(
          leaves: leavesDataFor(
            DateTime(DateTime.now().year, DateTime.now().month),
          ),
        )) {
    on<LeavesMonthChanged>(_onMonthChanged);
    on<LeavesSubmitted>(_onLeavesSubmitted, transformer: droppable());
  }

  void _onMonthChanged(LeavesMonthChanged event, Emitter<LeavesState> emit) {
    emit(state.copyWith(
      selectedMonth: event.month,
      leaves: leavesDataFor(event.month),
    ));
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
