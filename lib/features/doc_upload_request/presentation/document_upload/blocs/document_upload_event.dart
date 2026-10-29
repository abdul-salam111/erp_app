import 'package:equatable/equatable.dart';

abstract class DocumentUploadEvent extends Equatable {
  const DocumentUploadEvent();

  @override
  List<Object?> get props => [];
}

class DocumentUploadSubmitted extends DocumentUploadEvent {
  final int id;
  final List<String> filePaths;

  const DocumentUploadSubmitted({required this.id, required this.filePaths});

  @override
  List<Object?> get props => [id, filePaths];
}

class DocumentUploadReset extends DocumentUploadEvent {
  const DocumentUploadReset();
}
