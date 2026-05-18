import 'package:equatable/equatable.dart';

class ScanDocumentEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const ScanDocumentEntity({required this.id});

  @override
  List<Object> get props => [id];
}
