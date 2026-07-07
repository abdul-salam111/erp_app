import 'package:equatable/equatable.dart';

class ScannedDocument extends Equatable {
  final String id;
  final String name;
  final List<String> imagePaths;
  final DateTime createdAt;

  const ScannedDocument({
    required this.id,
    required this.name,
    required this.imagePaths,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, name, imagePaths, createdAt];
}
