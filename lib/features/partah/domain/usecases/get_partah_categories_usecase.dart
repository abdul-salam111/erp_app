import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/partah_category_entity.dart';
import '../repositories/partah_repository.dart';

class GetPartahCategoriesUsecase
    implements
        Usecase<({List<PartahCategoryEntity> categories, int unassignedCount}), NoParams> {
  final PartahRepository repository;

  GetPartahCategoriesUsecase({required this.repository});

  @override
  Future<Result<({List<PartahCategoryEntity> categories, int unassignedCount})>> call(
    NoParams params,
  ) {
    return repository.getCategories();
  }
}
