import 'package:equatable/equatable.dart';

class ScanDocumentEntity extends Equatable {
  final String id;

  const ScanDocumentEntity({required this.id});

  @override
  List<Object> get props => [id];
}
