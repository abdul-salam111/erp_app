import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../domain/usecases/get_partah_categories_usecase.dart';
import 'partah_categories_event.dart';
import 'partah_categories_state.dart';

class PartahCategoriesBloc extends Bloc<PartahCategoriesEvent, PartahCategoriesState> {
  final GetPartahCategoriesUsecase getCategories;

  PartahCategoriesBloc({required this.getCategories})
      : super(const PartahCategoriesState()) {
    on<PartahCategoriesStarted>(_onStarted, transformer: droppable());
  }

  Future<void> _onStarted(
    PartahCategoriesStarted event,
    Emitter<PartahCategoriesState> emit,
  ) async {
    emit(state.copyWith(loadStatus: ApiStatus.LOADING));
    final result = await getCategories(NoParams());
    result.when(
      failure: (failure) => emit(state.copyWith(
        loadStatus: ApiStatus.FAILURE,
        errorMessage: failure.message,
      )),
      success: (data) => emit(state.copyWith(
        loadStatus: ApiStatus.SUCCESS,
        categories: data.categories,
        unassignedCount: data.unassignedCount,
      )),
    );
  }
}
