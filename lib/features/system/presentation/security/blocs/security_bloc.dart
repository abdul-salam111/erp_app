import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/system_usecase.dart';
import 'security_event.dart';
import 'security_state.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState>
    with UsecaseExecuterMixin {
  final SystemUsecase systemUsecase;

  SecurityBloc({required this.systemUsecase})
      : super(const SecurityState()) {
    on<SecuritySubmitted>(_onSecuritySubmitted, transformer: droppable());
  }

  Future<void> _onSecuritySubmitted(
    SecuritySubmitted event,
    Emitter<SecurityState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => systemUsecase.call(
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
