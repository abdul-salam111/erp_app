import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/cost_item_entity.dart';
import '../repositories/partah_repository.dart';

class GetLastCostsUsecase
    implements Usecase<(List<CostItemEntity>, List<CostItemEntity>), NoParams> {
  final PartahRepository repository;

  GetLastCostsUsecase({required this.repository});

  @override
  Future<Result<(List<CostItemEntity>, List<CostItemEntity>)>> call(NoParams params) {
    return repository.getLastCosts();
  }
}
