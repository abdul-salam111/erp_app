import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/session_manager.dart';
import '../../../auth_exports.dart';
import '../../../data/models/request_models/select_branch_request_model/select_branch_request_model.dart';

class BranchSelectionBloc extends Bloc<BranchSelectionEvent, BranchSelectionState> {
  final SelectBranchUsecase selectBranchUsecase;
  final GetUserFeaturesUsecase getUserFeaturesUsecase;
  final GetUserRolesUsecase getUserRolesUsecase;

  BranchSelectionBloc({
    required this.selectBranchUsecase,
    required this.getUserFeaturesUsecase,
    required this.getUserRolesUsecase,
  }) : super(const BranchSelectionState()) {
    on<BranchSelectedEvent>(_onBranchSelected);
  }

  Future<void> _onBranchSelected(
    BranchSelectedEvent event,
    Emitter<BranchSelectionState> emit,
  ) async {
    final branch = event.org.branches.firstOrNull;

    if (branch == null || branch.accessToken == null || branch.refreshToken == null) {
      emit(state.copyWith(
        status: ApiStatus.FAILURE,
        message: AppConstants.branchTokenUnavailable,
        clearLoadingIndex: true,
      ));
      return;
    }

    emit(state.copyWith(
      status: ApiStatus.LOADING,
      loadingOrgIndex: event.orgIndex,
    ));

    final result = await selectBranchUsecase(
      SelectBranchRequestModel(
        accessToken: branch.accessToken!,
        misBranchId: branch.id.toString(),
        refreshToken: branch.refreshToken!,
      ),
    );

    await result.when(
      failure: (failure) async => emit(state.copyWith(
        status: ApiStatus.FAILURE,
        message: failure.message,
        clearLoadingIndex: true,
      )),
      success: (authToken) async {
        final finalToken = authToken.accessToken;
        if (finalToken == null) {
          emit(state.copyWith(
            status: ApiStatus.FAILURE,
            message: AppConstants.branchTokenUnavailable,
            clearLoadingIndex: true,
          ));
          return;
        }
        await SessionController.instance.saveSelectedOrganization(event.org);
        await SessionController.instance.updateActiveToken(finalToken);

        String? rolesErrorMsg;
        final rolesResult = await getUserRolesUsecase(finalToken);
        await rolesResult.when(
          failure: (f) async {
            rolesErrorMsg = f.message;
          },
          success: (roles) async {
            await SessionController.instance.saveUserRoles(roles);
            final user = SessionController.instance.loggedInUser;
            if (user != null) {
              final enrichedUser = UserEntity(
                id: user.id,
                firstName: user.firstName,
                lastName: user.lastName,
                email: user.email,
                languageName: user.languageName,
                organizations: user.organizations,
                isAdmin: SessionController.instance.isAdmin,
                roles: roles,
              );
              await SessionController.instance.saveUserInStorage(enrichedUser);
            }
          },
        );

        final featuresResult = await getUserFeaturesUsecase(finalToken);
        featuresResult.when(
          failure: (_) {},
          success: (features) async =>
              SessionController.instance.saveUserFeatures(features),
        );
        emit(state.copyWith(
          status: ApiStatus.SUCCESS,
          clearLoadingIndex: true,
          message: rolesErrorMsg,
          clearMessage: rolesErrorMsg == null,
        ));
      },
    );
  }
}
