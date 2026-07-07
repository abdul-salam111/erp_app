import '../entities/scanned_document.dart';
import '../repositories/scan_document_repository.dart';

class AddDocument {
  final DocumentRepository repository;

  AddDocument(this.repository);

  void call(ScannedDocument document) => repository.addDocument(document);
}
