import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/session_manager.dart';
import '../../../data/models/request_models/select_branch_request_model/select_branch_request_model.dart';
import '../../../domain/usecases/select_branch_usecase.dart';
import 'branch_selection_event.dart';
import 'branch_selection_state.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';

class BranchSelectionBloc extends Bloc<BranchSelectionEvent, BranchSelectionState> {
  final SelectBranchUsecase selectBranchUsecase;

  BranchSelectionBloc({required this.selectBranchUsecase})
      : super(const BranchSelectionState()) {
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

    await result.fold(
      (failure) async => emit(state.copyWith(
        status: ApiStatus.FAILURE,
        message: failure.message,
        clearLoadingIndex: true,
      )),
      (authToken) async {
        await SessionController.instance.saveSelectedOrganization(event.org);
        if (authToken.accessToken != null) {
          await SessionController.instance.updateActiveToken(authToken.accessToken!);
        }
        emit(state.copyWith(
          status: ApiStatus.SUCCESS,
          clearLoadingIndex: true,
        ));
      },
    );
  }
}
