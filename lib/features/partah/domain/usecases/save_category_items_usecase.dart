import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/partah_repository.dart';

class SaveCategoryItemsParams {
  final int categoryId;
  final List<int> itemIds;

  const SaveCategoryItemsParams({required this.categoryId, required this.itemIds});
}

class SaveCategoryItemsUsecase implements Usecase<void, SaveCategoryItemsParams> {
  final PartahRepository repository;

  SaveCategoryItemsUsecase({required this.repository});

  @override
  Future<Result<void>> call(SaveCategoryItemsParams params) {
    return repository.saveCategoryItems(
      categoryId: params.categoryId,
      itemIds: params.itemIds,
    );
  }
}
