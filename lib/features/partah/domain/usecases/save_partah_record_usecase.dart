import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/partah_record_entity.dart';
import '../repositories/partah_repository.dart';

class SavePartahRecordUsecase implements Usecase<String, PartahRecordEntity> {
  final PartahRepository repository;

  SavePartahRecordUsecase({required this.repository});

  @override
  Future<Result<String>> call(PartahRecordEntity params) {
    return repository.saveRecord(params);
  }
}
