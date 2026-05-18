import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import '../../../constants/const_exports.dart';
import '../../../errors/failures.dart';

mixin UsecaseExecuterMixin<Event, State> on Bloc<Event, State> {
  Future<void> executeUsecase<T>({
    required Emitter<State> emit,
    required State currentState,
    required Future<Either<Failure, T>> Function() usecase,
    required State Function(ApiStatus status, {T? data, String? error})
        stateBuilder,
  }) async {
    emit(stateBuilder(ApiStatus.LOADING));
    final result = await usecase();
    result.fold(
      (failure) => emit(stateBuilder(ApiStatus.FAILURE, error: failure.message)),
      (data) => emit(stateBuilder(ApiStatus.SUCCESS, data: data)),
    );
  }
}
