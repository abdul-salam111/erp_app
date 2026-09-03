import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/product_template_entity.dart';
import '../repositories/partah_repository.dart';

class SaveProductTemplatesUsecase implements Usecase<void, List<ProductTemplateEntity>> {
  final PartahRepository repository;

  SaveProductTemplatesUsecase({required this.repository});

  @override
  Future<Result<void>> call(List<ProductTemplateEntity> params) {
    return repository.saveProductTemplates(params);
  }
}
