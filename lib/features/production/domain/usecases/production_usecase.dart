import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../repositories/production_repository.dart';

class ProductionUsecase implements Usecase<dynamic, NoParams> {
  final ProductionRepository repository;

  ProductionUsecase({required this.repository});

  @override
  Future<Result<dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
