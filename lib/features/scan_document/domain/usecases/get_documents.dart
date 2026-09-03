import '../../../../core/utils/result.dart';
import '../entities/scanned_document.dart';
import '../repositories/scan_document_repository.dart';

class GetDocuments {
  final DocumentRepository repository;

  GetDocuments(this.repository);

  Future<Result<List<ScannedDocument>>> call() => repository.getDocuments();
}
