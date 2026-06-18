import 'package:equatable/equatable.dart';

class ProductionEntity extends Equatable {
  final String id;

  const ProductionEntity({required this.id});

  @override
  List<Object> get props => [id];
}
