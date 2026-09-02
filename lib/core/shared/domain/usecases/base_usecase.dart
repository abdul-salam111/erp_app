import 'package:bloc/bloc.dart';
import '../../../constants/const_exports.dart';
import '../../../utils/result.dart';

mixin UsecaseExecuterMixin<Event, State> on Bloc<Event, State> {
  Future<void> executeUsecase<T>({
    required Emitter<State> emit,
    required State currentState,
    required Future<Result<T>> Function() usecase,
    required State Function(ApiStatus status, {T? data, String? error})
        stateBuilder,
  }) async {
    if (emit.isDone) return;
    emit(stateBuilder(ApiStatus.LOADING));
    final result = await usecase();
    if (emit.isDone) return;
    result.when(
      failure: (f) => emit(stateBuilder(ApiStatus.FAILURE, error: f.message)),
      success: (data) => emit(stateBuilder(ApiStatus.SUCCESS, data: data)),
    );
  }
}
