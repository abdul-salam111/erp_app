import '../repositories/scan_document_repository.dart';

class DeleteDocument {
  final DocumentRepository repository;

  DeleteDocument(this.repository);

  void call(String id) => repository.deleteDocument(id);
}
