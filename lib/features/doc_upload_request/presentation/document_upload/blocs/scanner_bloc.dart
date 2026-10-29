import 'dart:io';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_doc_scanner/flutter_doc_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'scanner_event.dart';
import 'scanner_state.dart';

/// Drives the device's native document scanner UI (camera capture + edge
/// detection/crop) to produce image file paths for the upload-preview flow.
/// It only ever produces images in memory — nothing here is persisted.
class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  static const _channel = MethodChannel(
    'com.manticerp.softronix/content_resolver',
  );

  ScannerBloc() : super(const ScannerInitial()) {
    on<ScanStarted>(_onScanStarted, transformer: droppable());
  }

  Future<void> _onScanStarted(
    ScanStarted event,
    Emitter<ScannerState> emit,
  ) async {
    final status = await Permission.camera.request();
    if (!status.isGranted) {
      emit(const ScannerError('Camera permission required'));
      return;
    }

    emit(const ScannerScanning());

    try {
      final result = await FlutterDocScanner().getScannedDocumentAsImages(
        page: 10,
        imageFormat: ImageFormat.jpeg,
      );

      if (result == null || result.images.isEmpty) {
        emit(const ScannerInitial());
        return;
      }

      final paths = await _resolveImagePaths(result.images);

      if (paths.isEmpty) {
        emit(const ScannerInitial());
        return;
      }

      emit(ScannerScanned(paths));
    } catch (e) {
      emit(ScannerError(e.toString()));
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
}
