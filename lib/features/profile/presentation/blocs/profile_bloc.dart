import 'package:bloc/bloc.dart';

import '../../../../core/constants/app_enums.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../profile_exports.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>
    with UsecaseExecuterMixin {
  ProfileBloc() : super(const ProfileState()) {
    on<LogoutRequested>(_onLogoutRequested);
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(logoutStatus: ApiStatus.LOADING));
    await SessionController.instance.clearSession();
    emit(state.copyWith(logoutStatus: ApiStatus.SUCCESS));
  }
}
