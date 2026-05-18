import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/scan_document_repository.dart';

class ScanDocumentUsecase implements Usecase<dynamic, NoParams> {
  final ScanDocumentRepository repository;

  ScanDocumentUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
