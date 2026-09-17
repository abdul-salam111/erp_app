import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/const_exports.dart';
import '../../../../../../core/shared/shared_exports.dart';
import '../../../../../../core/utils/result.dart';
import '../../../../domain/entities/system_entity.dart';
import '../../../../domain/usecases/system_usecase.dart';
import 'new_user_event.dart';
import 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  final GetUserByIdUsecase getUserByIdUsecase;
  final GetLandingPageFeaturesUsecase getLandingPageFeaturesUsecase;
  final GetRoleListUsecase getRoleListUsecase;
  final GetBranchListUsecase getBranchListUsecase;
  final SaveUserUsecase saveUserUsecase;

  NewUserBloc({
    required this.getUserByIdUsecase,
    required this.getLandingPageFeaturesUsecase,
    required this.getRoleListUsecase,
    required this.getBranchListUsecase,
    required this.saveUserUsecase,
  }) : super(const NewUserState()) {
    on<NewUserFormLoaded>(_onFormLoaded, transformer: droppable());
    on<NewUserSubmitted>(_onSubmitted, transformer: droppable());
  }

  Future<void> _onSubmitted(
    NewUserSubmitted event,
    Emitter<NewUserState> emit,
  ) async {
    emit(state.copyWith(saveStatus: ApiStatus.LOADING, clearMessage: true));
    final result = await saveUserUsecase.call(event.payload);
    result.when(
      failure: (f) => emit(state.copyWith(
        saveStatus: ApiStatus.FAILURE,
        message: f.message,
      )),
      success: (data) => emit(state.copyWith(
        saveStatus: ApiStatus.SUCCESS,
        userDetail: data,
        clearMessage: true,
      )),
    );
  }

  Future<void> _onFormLoaded(
    NewUserFormLoaded event,
    Emitter<NewUserState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.LOADING, clearMessage: true));

    final results = await Future.wait([
      getLandingPageFeaturesUsecase.call(NoParams()),
      getBranchListUsecase.call(event.tenantId),
      if (event.userId != null) getUserByIdUsecase.call(event.userId!),
    ]);

    final landingResult = results[0] as Result;
    final branchesResult = results[1] as Result;
    final detailResult = event.userId != null ? results[2] as Result : null;

    var next = state;
    String? detailError;
    var branches = <BranchEntity>[];

    landingResult.when(
      failure: (_) {},
      success: (data) => next = next.copyWith(landingPages: data),
    );
    branchesResult.when(
      failure: (_) {},
      success: (data) {
        branches = data as List<BranchEntity>;
        next = next.copyWith(branches: data);
      },
    );
    detailResult?.when(
      failure: (f) => detailError = f.message,
      success: (data) => next = next.copyWith(userDetail: data),
    );

    if (detailError != null) {
      emit(next.copyWith(apiStatus: ApiStatus.FAILURE, message: detailError));
      return;
    }

    final orgIds = branches
        .map((b) => b.organizationId)
        .whereType<int>()
        .toSet()
        .toList();
    if (orgIds.isEmpty) {
      final rolesResult = await getRoleListUsecase.call(null);
      rolesResult.when(
        failure: (_) {},
        success: (data) => next = next.copyWith(availableRoles: data),
      );
    } else {
      final roleResults = await Future.wait(
        orgIds.map((id) => getRoleListUsecase.call(id)),
      );
      final combined = <RoleEntity>[];
      final seen = <int>{};
      for (final r in roleResults) {
        (r as Result).when(
          failure: (_) {},
          success: (data) {
            for (final role in (data as List<RoleEntity>)) {
              if (seen.add(role.id)) combined.add(role);
            }
          },
        );
      }
      next = next.copyWith(availableRoles: combined);
    }

    emit(next.copyWith(apiStatus: ApiStatus.SUCCESS, clearMessage: true));
  }
}
