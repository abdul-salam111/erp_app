import 'package:equatable/equatable.dart';

abstract class ProductionEvent extends Equatable {
  const ProductionEvent();

  @override
  List<Object> get props => [];
}

class ProductionSubmitted extends ProductionEvent {}
