import 'package:equatable/equatable.dart';
import '../../../domain/entities/scanned_document.dart';

abstract class ScannerState extends Equatable {
  const ScannerState();

  @override
  List<Object?> get props => [];
}

class ScannerInitial extends ScannerState {
  const ScannerInitial();
}

class ScannerScanning extends ScannerState {
  const ScannerScanning();
}

class ScannerNamingDocument extends ScannerState {
  final List<String> imagePaths;

  const ScannerNamingDocument(this.imagePaths);

  @override
  List<Object?> get props => [imagePaths];
}

class ScannerLoaded extends ScannerState {
  final List<ScannedDocument> documents;

  const ScannerLoaded(this.documents);

  @override
  List<Object?> get props => [documents];
}

class ScannerError extends ScannerState {
  final String message;

  const ScannerError(this.message);

  @override
  List<Object?> get props => [message];
}
