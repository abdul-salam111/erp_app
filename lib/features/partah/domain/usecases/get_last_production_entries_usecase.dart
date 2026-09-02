import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/production_entry_entity.dart';
import '../repositories/partah_repository.dart';

class GetLastProductionEntriesUsecase implements Usecase<List<ProductionEntryEntity>, NoParams> {
  final PartahRepository repository;

  GetLastProductionEntriesUsecase({required this.repository});

  @override
  Future<Result<List<ProductionEntryEntity>>> call(NoParams params) {
    return repository.getLastProductionEntries();
  }
}
