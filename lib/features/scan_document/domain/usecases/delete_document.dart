import '../../../../core/utils/result.dart';
import '../repositories/scan_document_repository.dart';

class DeleteDocument {
  final DocumentRepository repository;

  DeleteDocument(this.repository);

  Future<Result<void>> call(String id) => repository.deleteDocument(id);
}
