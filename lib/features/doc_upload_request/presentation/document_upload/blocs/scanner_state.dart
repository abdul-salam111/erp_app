import 'package:equatable/equatable.dart';

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

/// Scan finished — these image paths are not persisted anywhere, they're
/// handed straight to the upload-preview flow.
class ScannerScanned extends ScannerState {
  final List<String> imagePaths;

  const ScannerScanned(this.imagePaths);

  @override
  List<Object?> get props => [imagePaths];
}

class ScannerError extends ScannerState {
  final String message;

  const ScannerError(this.message);

  @override
  List<Object?> get props => [message];
}
