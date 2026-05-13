import '../../../../../app_exports.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>
    with UsecaseExecuterMixin {
  final SignInUsecase signinUsecase;

  SignInBloc({required this.signinUsecase}) : super(SignInState()) {
    on<SignInSubmitted>(_onSignInSubmitted);
    on<EmailChangedEvent>(
      (event, emit) => emit(state.copyWith(email: event.email)),
    );
    on<PasswordChangedEvent>(
      (event, emit) => emit(state.copyWith(password: event.password)),
    );
  }

  Future<void> _onSignInSubmitted(
    SignInSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => signinUsecase.call(
        LoginUserById(uid: state.email, password: state.password),
      ),
      stateBuilder: (status, {data, error}) =>
          state.copyWith(apiStatus: status, userToken: data, message: error),
    );
  }
}
