import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/security_usecase.dart';
import 'security_event.dart';
import 'security_state.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState>
    with UsecaseExecuterMixin {
  final SecurityUsecase securityUsecase;

  SecurityBloc({required this.securityUsecase})
      : super(const SecurityState()) {
    on<SecuritySubmitted>(_onSecuritySubmitted);
  }

  Future<void> _onSecuritySubmitted(
    SecuritySubmitted event,
    Emitter<SecurityState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => securityUsecase.call(
        NoParams(),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, data: data, message: error),
    );
  }
}
