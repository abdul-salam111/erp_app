import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/partah_category_product_entity.dart';
import '../repositories/partah_repository.dart';

class SearchCategoryProductsParams {
  final int? categoryId;
  final String? query;

  const SearchCategoryProductsParams({this.categoryId, this.query});
}

class SearchCategoryProductsUsecase
    implements Usecase<List<PartahCategoryProductEntity>, SearchCategoryProductsParams> {
  final PartahRepository repository;

  SearchCategoryProductsUsecase({required this.repository});

  @override
  Future<Result<List<PartahCategoryProductEntity>>> call(
    SearchCategoryProductsParams params,
  ) {
    return repository.searchCategoryProducts(
      categoryId: params.categoryId,
      query: params.query,
    );
  }
}
