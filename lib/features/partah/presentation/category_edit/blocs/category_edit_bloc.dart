import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/result.dart';
import '../../../domain/entities/partah_category_entity.dart';
import '../../../domain/usecases/save_category_items_usecase.dart';
import '../../../domain/usecases/save_partah_category_usecase.dart';
import '../../../domain/usecases/search_category_products_usecase.dart';
import 'category_edit_event.dart';
import 'category_edit_state.dart';

class CategoryEditBloc extends Bloc<CategoryEditEvent, CategoryEditState> {
  final SearchCategoryProductsUsecase searchCategoryProducts;
  final SavePartahCategoryUsecase saveCategory;
  final SaveCategoryItemsUsecase saveCategoryItems;

  CategoryEditBloc({
    required this.searchCategoryProducts,
    required this.saveCategory,
    required this.saveCategoryItems,
  }) : super(const CategoryEditState()) {
    on<CategoryEditStarted>(_onStarted, transformer: droppable());
    on<CategoryEditNameChanged>(_onNameChanged);
    on<CategoryEditRawMaterialToggled>(_onRawMaterialToggled);
    on<CategoryEditBagWeightChanged>(_onBagWeightChanged);
    on<CategoryEditSearchChanged>(_onSearchChanged);
    on<CategoryEditProductToggled>(_onProductToggled);
    on<CategoryEditSaveRequested>(_onSaveRequested, transformer: droppable());
  }

  Future<void> _onStarted(
    CategoryEditStarted event,
    Emitter<CategoryEditState> emit,
  ) async {
    final initial = event.initial;
    emit(state.copyWith(
      loadStatus: ApiStatus.LOADING,
      categoryId: initial?.id,
      categoryKey: initial?.categoryKey ?? '',
      sortOrder: initial?.sortOrder ?? 0,
      name: initial?.displayName ?? '',
      isRawMaterial: initial?.isRawMaterial ?? false,
      standardBagKg: initial?.standardBagKg ?? 100,
    ));

    final result = await searchCategoryProducts(
      SearchCategoryProductsParams(categoryId: initial?.id),
    );

    result.when(
      failure: (failure) => emit(state.copyWith(
        loadStatus: ApiStatus.FAILURE,
        errorMessage: failure.message,
      )),
      success: (products) => emit(state.copyWith(
        loadStatus: ApiStatus.SUCCESS,
        allProducts: products,
        selectedItemIds: products.where((p) => p.isAssigned).map((p) => p.itemId).toSet(),
      )),
    );
  }

  void _onNameChanged(CategoryEditNameChanged event, Emitter<CategoryEditState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onRawMaterialToggled(
    CategoryEditRawMaterialToggled event,
    Emitter<CategoryEditState> emit,
  ) {
    emit(state.copyWith(isRawMaterial: event.isRawMaterial));
  }

  void _onBagWeightChanged(
    CategoryEditBagWeightChanged event,
    Emitter<CategoryEditState> emit,
  ) {
    emit(state.copyWith(standardBagKg: event.standardBagKg));
  }

  void _onSearchChanged(CategoryEditSearchChanged event, Emitter<CategoryEditState> emit) {
    emit(state.copyWith(searchQuery: event.query));
  }

  void _onProductToggled(
    CategoryEditProductToggled event,
    Emitter<CategoryEditState> emit,
  ) {
    final updated = {...state.selectedItemIds};
    if (!updated.remove(event.itemId)) updated.add(event.itemId);
    emit(state.copyWith(selectedItemIds: updated));
  }

  Future<void> _onSaveRequested(
    CategoryEditSaveRequested event,
    Emitter<CategoryEditState> emit,
  ) async {
    emit(state.copyWith(saveStatus: ApiStatus.LOADING));

    final categoryResult = await saveCategory(PartahCategoryEntity(
      id: state.categoryId,
      categoryKey: state.categoryKey,
      displayName: state.name,
      standardBagKg: state.standardBagKg,
      sortOrder: state.sortOrder,
      isActive: true,
      isRawMaterial: state.isRawMaterial,
      itemCount: state.selectedItemIds.length,
      archived: false,
    ));

    if (categoryResult case ResultError(:final failure)) {
      emit(state.copyWith(saveStatus: ApiStatus.FAILURE, errorMessage: failure.message));
      return;
    }

    final saved = (categoryResult as Success<PartahCategoryEntity>).data;
    final categoryId = saved.id;
    if (categoryId == null) {
      emit(state.copyWith(
        saveStatus: ApiStatus.FAILURE,
        errorMessage: 'Category was saved but did not return an id.',
      ));
      return;
    }

    final itemsResult = await saveCategoryItems(SaveCategoryItemsParams(
      categoryId: categoryId,
      itemIds: state.selectedItemIds.toList(),
    ));

    itemsResult.when(
      failure: (failure) => emit(state.copyWith(
        saveStatus: ApiStatus.FAILURE,
        errorMessage: failure.message,
      )),
      success: (_) => emit(state.copyWith(saveStatus: ApiStatus.SUCCESS, saved: true)),
    );
  }
}
