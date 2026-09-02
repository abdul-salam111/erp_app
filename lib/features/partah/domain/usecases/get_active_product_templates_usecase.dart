import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/partah_repository.dart';

class GetActiveProductTemplatesUsecase implements Usecase<List<ProductTemplateEntity>, NoParams> {
  final PartahRepository repository;

  GetActiveProductTemplatesUsecase({required this.repository});

  @override
  Future<Result<List<ProductTemplateEntity>>> call(NoParams params) {
    return repository.getProductTemplates();
  }
}
