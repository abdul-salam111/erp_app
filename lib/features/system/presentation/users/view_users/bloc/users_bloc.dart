import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/shared/shared_exports.dart';
import '../../../../domain/usecases/system_usecase.dart';
import 'users_event.dart';
import 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState>
    with UsecaseExecuterMixin {
  final GetUsersListUsecase getUsersListUsecase;

  UsersBloc({required this.getUsersListUsecase})
      : super(const UsersState()) {
    on<UsersListFetched>(_onUsersListFetched, transformer: droppable());
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
}
