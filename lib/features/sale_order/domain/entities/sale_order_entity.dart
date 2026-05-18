import 'package:equatable/equatable.dart';

class SaleOrderEntity extends Equatable {
  final String id;
  // TODO: Add your entity properties here

  const SaleOrderEntity({required this.id});

  @override
  List<Object> get props => [id];
}
