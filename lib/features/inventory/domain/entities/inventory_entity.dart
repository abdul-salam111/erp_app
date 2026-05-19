import 'package:equatable/equatable.dart';

class InventoryEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const InventoryEntity({required this.id});

  @override
  List<Object> get props => [id];
}
