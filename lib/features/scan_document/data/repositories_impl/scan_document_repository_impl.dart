import '../../domain/entities/scanned_document.dart';
import '../../domain/repositories/scan_document_repository.dart';

class DocumentRepositoryImpl implements DocumentRepository {
  final List<ScannedDocument> _documents = [];

  @override
  List<ScannedDocument> getDocuments() => List.unmodifiable(_documents);

  @override
  void addDocument(ScannedDocument document) => _documents.add(document);

  @override
  void deleteDocument(String id) =>
      _documents.removeWhere((d) => d.id == id);
}
