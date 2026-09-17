import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/constants/const_exports.dart';
import '../../../../../../core/shared/shared_exports.dart';
import '../../../../domain/entities/system_entity.dart';
import '../../../../domain/usecases/system_usecase.dart';
import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState>
    with UsecaseExecuterMixin {
  final GetUsersListUsecase getUsersListUsecase;
  final DeleteUserUsecase deleteUserUsecase;

  UsersBloc({
    required this.getUsersListUsecase,
    required this.deleteUserUsecase,
  }) : super(const UsersState()) {
    on<UsersListFetched>(_onUsersListFetched, transformer: droppable());
    on<UserDeleteRequested>(_onUserDeleteRequested, transformer: droppable());
  }

  Future<void> _onUsersListFetched(
    UsersListFetched event,
    Emitter<UsersState> emit,
  ) async {
    await executeUsecase(
      emit: emit,
      currentState: state,
      usecase: () => getUsersListUsecase.call(NoParams()),
      stateBuilder: (status, {data, error}) => state.copyWith(
        apiStatus: status,
        users: data,
        message: error,
      ),
    );
  }

  Future<void> _onUserDeleteRequested(
    UserDeleteRequested event,
    Emitter<UsersState> emit,
  ) async {
    emit(state.copyWith(
      deleteStatus: ApiStatus.LOADING,
      deletingId: event.id,
      clearMessage: true,
    ));
    final result = await deleteUserUsecase.call(event.id);
    result.when(
      failure: (f) => emit(state.copyWith(
        deleteStatus: ApiStatus.FAILURE,
        message: f.message,
        clearDeletingId: true,
      )),
      success: (ok) {
        if (!ok) {
          emit(state.copyWith(
            deleteStatus: ApiStatus.FAILURE,
            message: 'Failed to delete user',
            clearDeletingId: true,
          ));
          return;
        }
        final remaining = (state.users ?? const <SystemUserEntity>[])
            .where((u) => u.id != event.id)
            .toList();
        emit(state.copyWith(
          deleteStatus: ApiStatus.SUCCESS,
          users: remaining,
          clearDeletingId: true,
          clearMessage: true,
        ));
      },
    );
  }
}
