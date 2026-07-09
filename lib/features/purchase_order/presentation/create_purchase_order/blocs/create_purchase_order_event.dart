import 'package:equatable/equatable.dart';

abstract class CreatePurchaseOrderEvent extends Equatable {
  const CreatePurchaseOrderEvent();

  @override
  List<Object> get props => [];
}

class CreatePurchaseOrderSubmitted extends CreatePurchaseOrderEvent {
  const CreatePurchaseOrderSubmitted();
}
