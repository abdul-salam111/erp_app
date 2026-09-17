import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/usecases/system_usecase.dart';
import 'new_role_event.dart';
import 'new_role_state.dart';

class NewRoleBloc extends Bloc<NewRoleEvent, NewRoleState> {
  final GetRoleByIdUsecase getRoleByIdUsecase;
  final SaveRoleUsecase saveRoleUsecase;

  NewRoleBloc({
    required this.getRoleByIdUsecase,
    required this.saveRoleUsecase,
  }) : super(const NewRoleState()) {
    on<NewRoleFormLoaded>(_onFormLoaded, transformer: droppable());
    on<NewRoleSubmitted>(_onSubmitted, transformer: droppable());
  }

  Future<void> _onFormLoaded(
    NewRoleFormLoaded event,
    Emitter<NewRoleState> emit,
  ) async {
    if (event.roleId == null) {
      emit(state.copyWith(apiStatus: ApiStatus.SUCCESS, clearMessage: true));
      return;
    }
    emit(state.copyWith(apiStatus: ApiStatus.LOADING, clearMessage: true));
    final result = await getRoleByIdUsecase.call(event.roleId!);
    result.when(
      failure: (f) => emit(state.copyWith(
        apiStatus: ApiStatus.FAILURE,
        message: f.message,
      )),
      success: (data) => emit(state.copyWith(
        apiStatus: ApiStatus.SUCCESS,
        role: data,
        clearMessage: true,
      )),
    );
  }

  Future<void> _onSubmitted(
    NewRoleSubmitted event,
    Emitter<NewRoleState> emit,
  ) async {
    emit(state.copyWith(saveStatus: ApiStatus.LOADING, clearMessage: true));
    final result = await saveRoleUsecase.call(event.payload);
    result.when(
      failure: (f) => emit(state.copyWith(
        saveStatus: ApiStatus.FAILURE,
        message: f.message,
      )),
      success: (data) => emit(state.copyWith(
        saveStatus: ApiStatus.SUCCESS,
        role: data,
        clearMessage: true,
      )),
    );
  }
}
