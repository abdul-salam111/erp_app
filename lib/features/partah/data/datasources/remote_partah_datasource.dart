import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/session_manager.dart';
import '../../../../core/shared/shared_exports.dart';
import '../models/request_models/create_partah_category/create_partah_category.dart';
import '../models/response_models/created_partah_category/created_partah_category.dart';
import '../models/response_models/partah_categories_list/partah_categories_list.dart';
import '../models/response_models/partah_category_products/partah_category_products.dart';

abstract interface class IRemotePartahDataSource {
  Future<PartahCategoriesList> getCategories();
  Future<List<PartahCategoryProducts>> getCategoryItems(int categoryId);
  Future<List<PartahCategoryProducts>> searchCategoryItems({
    int? categoryId,
    String? query,
  });
  Future<CreatedPartahCategory> saveCategory(CreatePartahCategory category);
  Future<void> saveCategoryItems({
    required int categoryId,
    required List<int> itemIds,
  });
}

class RemotePartahDataSourceImpl extends BaseRemoteDatasource
    implements IRemotePartahDataSource {
  RemotePartahDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<PartahCategoriesList> getCategories() {
    return post<PartahCategoriesList>(
      url: ApiEndPoints.partah.getCategoriesList,
      body: {'FlgExcludeArchived': true, 'IsActive': true},
      parser: (json) => PartahCategoriesList.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<List<PartahCategoryProducts>> getCategoryItems(int categoryId) {
    return getList<PartahCategoryProducts>(
      url: ApiEndPoints.partah.getCategoryItems(categoryId),
      parser: (json) => PartahCategoryProducts.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  // SearchItems is the full catalog browse/search pool — it does NOT filter by
  // ProductCategoryId (confirmed against the live backend), so it's only used
  // to list all assignable products. GetCategoryItems is the source of truth
  // for which items are actually assigned to a category.
  @override
  Future<List<PartahCategoryProducts>> searchCategoryItems({
    int? categoryId,
    String? query,
  }) {
    return postList<PartahCategoryProducts>(
      url: ApiEndPoints.partah.searchCategoryItems,
      body: {
        'ProductCategoryId': categoryId,
        'Take': 500,
      },
      parser: (json) => PartahCategoryProducts.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<CreatedPartahCategory> saveCategory(CreatePartahCategory category) {
    return post<CreatedPartahCategory>(
      url: ApiEndPoints.partah.insertOrUpdateCategory,
      body: category.toJson(),
      parser: (json) => CreatedPartahCategory.fromJson(json as Map<String, dynamic>),
      authToken: _token,
    );
  }

  @override
  Future<void> saveCategoryItems({
    required int categoryId,
    required List<int> itemIds,
  }) {
    return post<void>(
      url: ApiEndPoints.partah.saveCategoryItems,
      body: {
        'ItemIds': itemIds,
        'ProductCategoryId': categoryId,
      },
      parser: (_) {},
      authToken: _token,
    );
  }
}
