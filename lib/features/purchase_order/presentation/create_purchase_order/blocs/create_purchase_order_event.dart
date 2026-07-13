import 'package:equatable/equatable.dart';

abstract class CreatePurchaseOrderEvent extends Equatable {
  const CreatePurchaseOrderEvent();

  @override
  List<Object?> get props => [];
}

class PurchaseOrderDateChanged extends CreatePurchaseOrderEvent {
  final DateTime date;
  const PurchaseOrderDateChanged(this.date);
  @override
  List<Object?> get props => [date];
}

class CreatePurchaseOrderSubmitted extends CreatePurchaseOrderEvent {
  const CreatePurchaseOrderSubmitted();
}
