import 'package:equatable/equatable.dart';

abstract class ScanDocumentEvent extends Equatable {
  const ScanDocumentEvent();

  @override
  List<Object> get props => [];
}

class ScanDocumentSubmitted extends ScanDocumentEvent {}
