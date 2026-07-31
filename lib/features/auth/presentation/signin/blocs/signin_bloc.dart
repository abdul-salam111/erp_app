import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/session_manager.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../auth_exports.dart';
import '../../../data/models/request_models/select_branch_request_model/select_branch_request_model.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>
    with UsecaseExecuterMixin {
  final SignInUsecase signinUsecase;
  final SelectBranchUsecase selectBranchUsecase;

  SignInBloc({
    required this.signinUsecase,
    required this.selectBranchUsecase,
  }) : super(const SignInState()) {
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

        if (user.organizations.length == 1) {
          // Single org — auto-select and call SelectBranch before navigating.
          final org = user.organizations.first;
          await SessionController.instance.saveSelectedOrganization(org);

          final branch = org.branches.firstOrNull;
          if (branch == null ||
              branch.accessToken == null ||
              branch.refreshToken == null) {
            emit(state.copyWith(
              apiStatus: ApiStatus.FAILURE,
              message: AppConstants.branchTokenUnavailable,
            ));
            return;
          }

          final branchResult = await selectBranchUsecase(
            SelectBranchRequestModel(
              accessToken: branch.accessToken!,
              misBranchId: branch.id.toString(),
              refreshToken: branch.refreshToken!,
            ),
          );

          await branchResult.when(
            failure: (failure) async => emit(state.copyWith(
              apiStatus: ApiStatus.FAILURE,
              message: failure.message,
            )),
            success: (authToken) async {
              if (authToken.accessToken != null) {
                await SessionController.instance
                    .updateActiveToken(authToken.accessToken!);
              }
              emit(state.copyWith(apiStatus: ApiStatus.SUCCESS, user: user));
            },
          );
        } else {
          // Multiple orgs — show org selection screen; SelectBranch called there.
          emit(state.copyWith(apiStatus: ApiStatus.SUCCESS, user: user));
        }
      },
    );
  }
}
