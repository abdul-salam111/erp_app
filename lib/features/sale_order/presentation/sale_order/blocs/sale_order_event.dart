import 'package:equatable/equatable.dart';

abstract class SaleOrderEvent extends Equatable {
  const SaleOrderEvent();

  @override
  List<Object> get props => [];
}

class SaleOrderSubmitted extends SaleOrderEvent {}
