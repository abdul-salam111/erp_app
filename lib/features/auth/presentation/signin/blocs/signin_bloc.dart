import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/session_manager.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../auth_exports.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>
    with UsecaseExecuterMixin {
  final SignInUsecase signinUsecase;

  SignInBloc({required this.signinUsecase}) : super(const SignInState()) {
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
    emit(state.copyWith(apiStatus: ApiStatus.LOADING));
    final result = await signinUsecase.call(
      LoginRequestModel(email: state.email, password: state.password),
    );
    await result.when(
      failure: (failure) async => emit(
        state.copyWith(apiStatus: ApiStatus.FAILURE, message: failure.message),
      ),
      success: (user) async {
        await SessionController.instance.saveUserInStorage(user);
        // Auto-save when user belongs to a single organization.
        if (user.organizations.length == 1) {
          await SessionController.instance
              .saveSelectedOrganization(user.organizations.first);
        }
        emit(state.copyWith(apiStatus: ApiStatus.SUCCESS, user: user));
      },
    );
  }
}
