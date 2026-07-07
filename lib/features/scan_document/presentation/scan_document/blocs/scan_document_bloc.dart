import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../domain/entities/scanned_document.dart';
import '../../../domain/usecases/add_document.dart';
import '../../../domain/usecases/delete_document.dart';
import '../../../domain/usecases/get_documents.dart';
import 'scan_document_event.dart';
import 'scan_document_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  final GetDocuments _getDocuments;
  final AddDocument _addDocument;
  final DeleteDocument _deleteDocument;

  ScannerBloc({
    required GetDocuments getDocuments,
    required AddDocument addDocument,
    required DeleteDocument deleteDocument,
  })  : _getDocuments = getDocuments,
        _addDocument = addDocument,
        _deleteDocument = deleteDocument,
        super(const ScannerInitial()) {
    on<DocumentsLoaded>(_onDocumentsLoaded);
    on<ScanStarted>(_onScanStarted);
    on<DocumentNamed>(_onDocumentNamed);
    on<DocumentDeleted>(_onDocumentDeleted);
  }

  void _onDocumentsLoaded(
    DocumentsLoaded event,
    Emitter<ScannerState> emit,
  ) {
    emit(ScannerLoaded(_getDocuments()));
  }

  Future<void> _onScanStarted(
    ScanStarted event,
    Emitter<ScannerState> emit,
  ) async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      emit(const ScannerError('Camera permission required'));
      emit(ScannerLoaded(_getDocuments()));
      return;
    }

    emit(const ScannerScanning());

    try {
      final result = await FlutterDocScanner().getScannedDocumentAsImages(
        page: 10,
        imageFormat: ImageFormat.jpeg,
      );

      if (result == null || (result as List).isEmpty) {
        emit(ScannerLoaded(_getDocuments()));
        return;
      }

      final cleanedPaths = (result as List)
          .map((p) => p.toString().replaceFirst('file://', ''))
          .toList();

      emit(ScannerNamingDocument(List<String>.from(cleanedPaths)));
    } catch (_) {
      emit(ScannerLoaded(_getDocuments()));
    }
  }

  void _onDocumentNamed(
    DocumentNamed event,
    Emitter<ScannerState> emit,
  ) {
    final doc = ScannedDocument(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: event.name,
      imagePaths: event.imagePaths,
      createdAt: DateTime.now(),
    );
    _addDocument(doc);
    emit(ScannerLoaded(_getDocuments()));
  }

  void _onDocumentDeleted(
    DocumentDeleted event,
    Emitter<ScannerState> emit,
  ) {
    _deleteDocument(event.id);
    emit(ScannerLoaded(_getDocuments()));
  }
}
