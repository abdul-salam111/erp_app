import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/partah_category_product_entity.dart';

class CategoryEditState extends Equatable {
  final int? categoryId;
  final String categoryKey;
  final int sortOrder;
  final String name;
  final bool isRawMaterial;
  final int standardBagKg;
  final ApiStatus loadStatus;
  final ApiStatus saveStatus;
  final List<PartahCategoryProductEntity> allProducts;
  final Set<int> selectedItemIds;
  final String searchQuery;
  final String? errorMessage;
  final bool saved;

  const CategoryEditState({
    this.categoryId,
    this.categoryKey = '',
    this.sortOrder = 0,
    this.name = '',
    this.isRawMaterial = false,
    this.standardBagKg = 100,
    this.loadStatus = ApiStatus.INITIAL,
    this.saveStatus = ApiStatus.INITIAL,
    this.allProducts = const [],
    this.selectedItemIds = const {},
    this.searchQuery = '',
    this.errorMessage,
    this.saved = false,
  });

  bool get isEditing => categoryId != null;

  List<PartahCategoryProductEntity> get filteredProducts {
    if (searchQuery.trim().isEmpty) return allProducts;
    final q = searchQuery.trim().toLowerCase();
    return allProducts
        .where((p) =>
            p.itemName.toLowerCase().contains(q) ||
            (p.itemGroupName?.toLowerCase().contains(q) ?? false))
        .toList();
  }

  CategoryEditState copyWith({
    int? categoryId,
    String? categoryKey,
    int? sortOrder,
    String? name,
    bool? isRawMaterial,
    int? standardBagKg,
    ApiStatus? loadStatus,
    ApiStatus? saveStatus,
    List<PartahCategoryProductEntity>? allProducts,
    Set<int>? selectedItemIds,
    String? searchQuery,
    String? errorMessage,
    bool? saved,
  }) {
    return CategoryEditState(
      categoryId: categoryId ?? this.categoryId,
      categoryKey: categoryKey ?? this.categoryKey,
      sortOrder: sortOrder ?? this.sortOrder,
      name: name ?? this.name,
      isRawMaterial: isRawMaterial ?? this.isRawMaterial,
      standardBagKg: standardBagKg ?? this.standardBagKg,
      loadStatus: loadStatus ?? this.loadStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      allProducts: allProducts ?? this.allProducts,
      selectedItemIds: selectedItemIds ?? this.selectedItemIds,
      searchQuery: searchQuery ?? this.searchQuery,
      errorMessage: errorMessage,
      saved: saved ?? this.saved,
    );
  }

  @override
  List<Object?> get props => [
        categoryId,
        categoryKey,
        sortOrder,
        name,
        isRawMaterial,
        standardBagKg,
        loadStatus,
        saveStatus,
        allProducts,
        selectedItemIds,
        searchQuery,
        errorMessage,
        saved,
      ];
}
