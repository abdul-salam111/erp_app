import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/session_manager.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../auth_exports.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>
    with UsecaseExecuterMixin {
  final SignInUsecase signinUsecase;
  final SelectBranchUsecase selectBranchUsecase;
  final GetUserFeaturesUsecase getUserFeaturesUsecase;
  final GetUserRolesUsecase getUserRolesUsecase;

  SignInBloc({
    required this.signinUsecase,
    required this.selectBranchUsecase,
    required this.getUserFeaturesUsecase,
    required this.getUserRolesUsecase,
  }) : super(const SignInState()) {
    on<SignInSubmitted>(_onSignInSubmitted, transformer: droppable());
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
      LoginParams(email: state.email, password: state.password),
    );
    await result.when(
      failure: (failure) async => emit(
        state.copyWith(apiStatus: ApiStatus.FAILURE, message: failure.message),
      ),
      success: (user) async {
        await SessionController.instance.saveCredentials(
          state.email,
          state.password,
        );
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
            SelectBranchParams(
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
              final finalToken = authToken.accessToken;
              UserEntity enrichedUser = user;
              String? rolesError;
              if (finalToken != null) {
                await SessionController.instance.updateActiveSession(authToken);
                final rolesResult = await getUserRolesUsecase(finalToken);
                await rolesResult.when(
                  failure: (f) async {
                    rolesError = f.message;
                  },
                  success: (roles) async {
                    await SessionController.instance.saveUserRoles(roles);
                    enrichedUser = UserEntity(
                      id: user.id,
                      firstName: user.firstName,
                      lastName: user.lastName,
                      email: user.email,
                      languageName: user.languageName,
                      organizations: user.organizations,
                      isAdmin: SessionController.instance.isAdmin,
                      roles: roles,
                    );
                    await SessionController.instance
                        .saveUserInStorage(enrichedUser);
                  },
                );

                final featuresResult = await getUserFeaturesUsecase(finalToken);
                featuresResult.when(
                  failure: (_) {},
                  success: (features) async =>
                      SessionController.instance.saveUserFeatures(features),
                );
              }
              emit(state.copyWith(
                apiStatus: ApiStatus.SUCCESS,
                user: enrichedUser,
                message: rolesError,
              ));
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
