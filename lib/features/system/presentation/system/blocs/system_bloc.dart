import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/system_usecase.dart';
import 'system_event.dart';
import 'system_state.dart';

class SystemBloc extends Bloc<SystemEvent, SystemState>
    with UsecaseExecuterMixin {
  final SystemUsecase systemUsecase;

  SystemBloc({required this.systemUsecase})
      : super(const SystemState()) {
    on<SystemSubmitted>(_onSystemSubmitted);
  }

  Future<void> _onSystemSubmitted(
    SystemSubmitted event,
    Emitter<SystemState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => systemUsecase.call(
        // TODO: Pass your parameters here
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
