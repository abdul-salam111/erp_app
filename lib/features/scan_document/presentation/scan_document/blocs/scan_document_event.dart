import 'package:equatable/equatable.dart';

abstract class ScannerEvent extends Equatable {
  const ScannerEvent();

  @override
  List<Object?> get props => [];
}

class DocumentsLoaded extends ScannerEvent {
  const DocumentsLoaded();
}

class ScanStarted extends ScannerEvent {
  const ScanStarted();
}

class DocumentNamed extends ScannerEvent {
  final List<String> imagePaths;
  final String name;

  const DocumentNamed({required this.imagePaths, required this.name});

  @override
  List<Object?> get props => [imagePaths, name];
}

class DocumentDeleted extends ScannerEvent {
  final String id;

  const DocumentDeleted(this.id);

  @override
  List<Object?> get props => [id];
}
