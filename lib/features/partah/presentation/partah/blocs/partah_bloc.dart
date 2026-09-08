import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/local_storage/mill_config_store.dart';
import '../../../../../core/shared/shared_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../../domain/entities/partah_category_entity.dart';
import '../../../domain/usecases/get_partah_categories_usecase.dart';
import 'partah_event.dart';
import 'partah_state.dart';

class PartahBloc extends Bloc<PartahEvent, PartahState> {
  final GetPartahCategoriesUsecase getCategories;

  PartahBloc({required this.getCategories}) : super(const PartahState()) {
    on<PartahStarted>(_onStarted, transformer: droppable());
  }

  Future<void> _onStarted(PartahStarted event, Emitter<PartahState> emit) async {
    emit(state.copyWith(loadStatus: ApiStatus.LOADING));

    final categoriesFuture = getCategories(NoParams());
    final millTypeFuture = MillConfigStore.getMillType();

    final categoriesResult = await categoriesFuture;
    final millType = await millTypeFuture;

    if (categoriesResult case ResultError(:final failure)) {
      emit(state.copyWith(loadStatus: ApiStatus.FAILURE, errorMessage: failure.message));
      return;
    }

    final data = (categoriesResult
            as Success<({List<PartahCategoryEntity> categories, int unassignedCount})>)
        .data;

    emit(state.copyWith(
      loadStatus: ApiStatus.SUCCESS,
      millType: millType,
      categories: data.categories,
    ));
  }
}
