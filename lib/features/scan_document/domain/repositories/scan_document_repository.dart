import '../entities/scanned_document.dart';

abstract class DocumentRepository {
  List<ScannedDocument> getDocuments();
  void addDocument(ScannedDocument document);
  void deleteDocument(String id);
}
