import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/partah_record_entity.dart';
import '../repositories/partah_repository.dart';

class GetAllReportsUsecase implements Usecase<List<PartahRecordEntity>, NoParams> {
  final PartahRepository repository;

  GetAllReportsUsecase({required this.repository});

  @override
  Future<Result<List<PartahRecordEntity>>> call(NoParams params) {
    return repository.getAllRecords();
  }
}
