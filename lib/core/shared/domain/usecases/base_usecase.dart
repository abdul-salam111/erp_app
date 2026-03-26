import '../../../../app_exports.dart';

mixin UsecaseExecuterMixin<Event, State> on Bloc<Event, State> {
  Future<void> executeUsecase<T>({
    required Emitter<State> emit,
    required State currentState,
    required Future<Either<dynamic, T>> Function() usecase,
    required State Function(ApiStatus status, {T? data, String? error})
    stateBuilder,
  }) async {
    emit(stateBuilder(ApiStatus.LOADING));
    final result = await usecase();
    result.fold(
      (failure) =>
          emit(stateBuilder(ApiStatus.FAILURE, error: failure.toString())),
      (data) => emit(stateBuilder(ApiStatus.SUCCESS, data: data)),
    );
  }
}
