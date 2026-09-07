import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/partah_category_entity.dart';
import '../repositories/partah_repository.dart';

class SavePartahCategoryUsecase
    implements Usecase<PartahCategoryEntity, PartahCategoryEntity> {
  final PartahRepository repository;

  SavePartahCategoryUsecase({required this.repository});

  @override
  Future<Result<PartahCategoryEntity>> call(PartahCategoryEntity params) {
    return repository.saveCategory(params);
  }
}
