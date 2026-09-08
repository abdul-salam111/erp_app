import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/partah_category_entity.dart';
import '../../domain/entities/partah_category_product_entity.dart';
import '../../domain/repositories/partah_repository.dart';
import '../datasources/remote_partah_datasource.dart';
import '../models/request_models/create_partah_category/create_partah_category.dart';
import '../models/response_models/created_partah_category/created_partah_category.dart';
import '../models/response_models/partah_categories_list/partah_categories_list.dart' as list_model;
import '../models/response_models/partah_category_products/partah_category_products.dart';

class PartahRepositoryImpl extends BaseRepository implements PartahRepository {
  final IRemotePartahDataSource dataSource;

  PartahRepositoryImpl({required this.dataSource});

  @override
  Future<Result<({List<PartahCategoryEntity> categories, int unassignedCount})>>
      getCategories() {
    return execute(
      call: () async {
        final response = await dataSource.getCategories();
        final categories = (response.categories ?? []).map(_toEntity).toList();
        return (
          categories: categories,
          unassignedCount: response.unassignedItemCount ?? 0,
        );
      },
    );
  }

  @override
  Future<Result<List<PartahCategoryProductEntity>>> searchCategoryProducts({
    int? categoryId,
    String? query,
  }) {
    return execute(
      call: () async {
        final all = await dataSource.searchCategoryItems(categoryId: categoryId);

        final assignedIds = categoryId == null
            ? const <int>{}
            : (await dataSource.getCategoryItems(categoryId))
                .map((p) => p.itemId)
                .whereType<int>()
                .toSet();

        return all
            .where((p) => p.itemId != null)
            .map((p) => _toProductEntity(p, isAssigned: assignedIds.contains(p.itemId)))
            .toList();
      },
    );
  }

  @override
  Future<Result<PartahCategoryEntity>> saveCategory(PartahCategoryEntity category) {
    return execute(
      call: () async {
        final saved = await dataSource.saveCategory(
          CreatePartahCategory(
            id: category.id,
            categoryKey: category.categoryKey,
            displayName: category.displayName,
            isActive: category.isActive,
            isRawMaterial: category.isRawMaterial,
            sortOrder: category.sortOrder,
            standardBagKg: category.standardBagKg,
          ),
        );
        return _createdToEntity(saved);
      },
    );
  }

  @override
  Future<Result<void>> saveCategoryItems({
    required int categoryId,
    required List<int> itemIds,
  }) {
    return execute(
      call: () => dataSource.saveCategoryItems(categoryId: categoryId, itemIds: itemIds),
    );
  }

  PartahCategoryEntity _toEntity(list_model.Category c) {
    return PartahCategoryEntity(
      id: c.id,
      categoryKey: c.categoryKey ?? '',
      displayName: c.displayName ?? '',
      standardBagKg: c.standardBagKg ?? 0,
      sortOrder: c.sortOrder ?? 0,
      isActive: c.isActive ?? true,
      isRawMaterial: c.isRawMaterial ?? false,
      itemCount: c.itemCount ?? 0,
      archived: c.archived ?? false,
    );
  }

  PartahCategoryEntity _createdToEntity(CreatedPartahCategory c) {
    return PartahCategoryEntity(
      id: c.id,
      categoryKey: c.categoryKey ?? '',
      displayName: c.displayName ?? '',
      standardBagKg: c.standardBagKg ?? 0,
      sortOrder: c.sortOrder ?? 0,
      isActive: c.isActive ?? true,
      isRawMaterial: c.isRawMaterial ?? false,
      itemCount: c.itemCount ?? 0,
      archived: c.archived ?? false,
    );
  }

  PartahCategoryProductEntity _toProductEntity(
    PartahCategoryProducts p, {
    required bool isAssigned,
  }) {
    return PartahCategoryProductEntity(
      itemId: p.itemId ?? 0,
      itemName: p.itemName ?? '',
      itemGroupName: p.itemGroupName,
      isAssigned: isAssigned,
    );
  }
}
