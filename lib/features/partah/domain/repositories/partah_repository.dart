import '../../../../core/utils/result.dart';
import '../entities/partah_category_entity.dart';
import '../entities/partah_category_product_entity.dart';

abstract interface class PartahRepository {
  Future<Result<({List<PartahCategoryEntity> categories, int unassignedCount})>>
      getCategories();

  Future<Result<List<PartahCategoryProductEntity>>> searchCategoryProducts({
    int? categoryId,
    String? query,
  });

  Future<Result<PartahCategoryEntity>> saveCategory(PartahCategoryEntity category);

  Future<Result<void>> saveCategoryItems({
    required int categoryId,
    required List<int> itemIds,
  });
}
