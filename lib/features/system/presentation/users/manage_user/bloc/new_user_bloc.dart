import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/const_exports.dart';
import '../../../../../../core/shared/shared_exports.dart';
import '../../../../../../core/utils/result.dart';
import '../../../../domain/usecases/system_usecase.dart';
import 'new_user_event.dart';
import 'new_user_state.dart';

class NewUserBloc extends Bloc<NewUserEvent, NewUserState> {
  final GetUserByIdUsecase getUserByIdUsecase;
  final GetLandingPageFeaturesUsecase getLandingPageFeaturesUsecase;
  final GetRoleListUsecase getRoleListUsecase;

  NewUserBloc({
    required this.getUserByIdUsecase,
    required this.getLandingPageFeaturesUsecase,
    required this.getRoleListUsecase,
  }) : super(const NewUserState()) {
    on<NewUserFormLoaded>(_onFormLoaded, transformer: droppable());
  }

  Future<void> _onFormLoaded(
    NewUserFormLoaded event,
    Emitter<NewUserState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.LOADING, clearMessage: true));

    final results = await Future.wait([
      getLandingPageFeaturesUsecase.call(NoParams()),
      getRoleListUsecase.call(NoParams()),
      if (event.userId != null) getUserByIdUsecase.call(event.userId!),
    ]);

    final landingResult = results[0] as Result;
    final rolesResult = results[1] as Result;
    final detailResult = event.userId != null ? results[2] as Result : null;

    var next = state;
    String? detailError;

    landingResult.when(
      failure: (_) {},
      success: (data) => next = next.copyWith(landingPages: data),
    );
    rolesResult.when(
      failure: (_) {},
      success: (data) => next = next.copyWith(availableRoles: data),
    );
    detailResult?.when(
      failure: (f) => detailError = f.message,
      success: (data) => next = next.copyWith(userDetail: data),
    );

    if (detailError != null) {
      emit(next.copyWith(apiStatus: ApiStatus.FAILURE, message: detailError));
      return;
    }
    emit(next.copyWith(apiStatus: ApiStatus.SUCCESS, clearMessage: true));
  }
}
