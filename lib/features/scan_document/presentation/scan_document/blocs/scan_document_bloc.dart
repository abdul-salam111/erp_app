import 'dart:io';
import 'package:flutter/services.dart';
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

  static const _channel = MethodChannel(
    'com.manticerp.softronix/content_resolver',
  );

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

      if (result == null || result.images.isEmpty) {
        emit(ScannerLoaded(_getDocuments()));
        return;
      }

      final paths = await _resolveImagePaths(result.images);

      if (paths.isEmpty) {
        emit(ScannerLoaded(_getDocuments()));
        return;
      }

      emit(ScannerNamingDocument(paths));
    } catch (e) {
      emit(ScannerError(e.toString()));
      emit(ScannerLoaded(_getDocuments()));
    }
  }

  // On Android, ML Kit returns content:// URIs — copy them to real cache files.
  // On iOS, images are already file paths.
  Future<List<String>> _resolveImagePaths(List<String> uris) async {
    if (!Platform.isAndroid) {
      return uris.map((p) => p.replaceFirst('file://', '')).toList();
    }

    final contentUris = uris.where((u) => u.startsWith('content://')).toList();
    if (contentUris.isEmpty) {
      return uris.map((p) => p.replaceFirst('file://', '')).toList();
    }

    final resolved = await _channel.invokeMethod<List<dynamic>>(
      'copyContentUriToFile',
      {'uris': uris},
    );
    return resolved?.cast<String>() ?? [];
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
