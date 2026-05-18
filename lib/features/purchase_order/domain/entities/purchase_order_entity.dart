import 'package:equatable/equatable.dart';

class PurchaseOrderEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const PurchaseOrderEntity({required this.id});

  @override
  List<Object> get props => [id];
}
