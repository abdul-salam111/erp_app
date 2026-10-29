import 'package:equatable/equatable.dart';

abstract class DocumentUploadEvent extends Equatable {
  const DocumentUploadEvent();

  @override
  List<Object?> get props => [];
}

class DocumentUploadSubmitted extends DocumentUploadEvent {
  final int id;
  final String filePath;

  const DocumentUploadSubmitted({required this.id, required this.filePath});

  @override
  List<Object?> get props => [id, filePath];
}

class DocumentUploadReset extends DocumentUploadEvent {
  const DocumentUploadReset();
}
