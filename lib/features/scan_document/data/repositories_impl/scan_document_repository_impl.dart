import '../../../../core/shared/domain/repository/base_repository.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/scanned_document.dart';
import '../../domain/repositories/scan_document_repository.dart';

class DocumentRepositoryImpl extends BaseRepository
    implements DocumentRepository {
  final List<ScannedDocument> _documents = [];

  @override
  Future<Result<List<ScannedDocument>>> getDocuments() => execute(
        call: () async => List.unmodifiable(_documents),
      );

  @override
  Future<Result<void>> addDocument(ScannedDocument document) => execute(
        call: () async => _documents.add(document),
      );

  @override
  Future<Result<void>> deleteDocument(String id) => execute(
        call: () async => _documents.removeWhere((d) => d.id == id),
      );
}
