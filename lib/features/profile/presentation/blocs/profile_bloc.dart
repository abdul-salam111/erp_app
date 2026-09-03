import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../../core/constants/app_enums.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../../auth/auth_exports.dart';
import '../../profile_exports.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>
    with UsecaseExecuterMixin {
  final DeleteTokenUsecase deleteTokenUsecase;

  ProfileBloc({required this.deleteTokenUsecase})
      : super(const ProfileState()) {
    on<LogoutRequested>(_onLogoutRequested, transformer: droppable());
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(logoutStatus: ApiStatus.LOADING));
    final token = SessionController.instance.activeAccessToken;
    if (token != null) {
      // Best-effort — proceed with local logout regardless of API result.
      await deleteTokenUsecase(token);
    }
    await SessionController.instance.clearSession();
    emit(state.copyWith(logoutStatus: ApiStatus.SUCCESS));
  }
}
