import 'package:equatable/equatable.dart';

class ProductionEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const ProductionEntity({required this.id});

  @override
  List<Object> get props => [id];
}
