import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/usecases/system_usecase.dart';
import 'roles_event.dart';
import 'roles_state.dart';

class RolesBloc extends Bloc<RolesEvent, RolesState> {
  final GetRoleListUsecase getRoleListUsecase;

  RolesBloc({required this.getRoleListUsecase}) : super(const RolesState()) {
    on<RolesListFetched>(_onFetched, transformer: droppable());
  }

  Future<void> _onFetched(
    RolesListFetched event,
    Emitter<RolesState> emit,
  ) async {
    emit(state.copyWith(apiStatus: ApiStatus.LOADING, clearMessage: true));
    final result = await getRoleListUsecase.call(null);
    result.when(
      failure: (f) => emit(state.copyWith(
        apiStatus: ApiStatus.FAILURE,
        message: f.message,
      )),
      success: (data) => emit(state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
        roles: data,
        clearMessage: true,
      )),
    );
  }
}
