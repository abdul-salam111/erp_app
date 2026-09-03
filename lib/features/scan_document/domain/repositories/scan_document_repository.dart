import '../../../../core/utils/result.dart';
import '../entities/scanned_document.dart';

abstract class DocumentRepository {
  Future<Result<List<ScannedDocument>>> getDocuments();
  Future<Result<void>> addDocument(ScannedDocument document);
  Future<Result<void>> deleteDocument(String id);
}
