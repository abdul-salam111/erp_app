import '../../../../core/utils/result.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/partah_repository.dart';

class DeleteReportUsecase implements Usecase<void, String> {
  final PartahRepository repository;

  DeleteReportUsecase({required this.repository});

  @override
  Future<Result<void>> call(String params) {
    return repository.deleteRecord(params);
  }
}
