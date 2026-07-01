import 'package:equatable/equatable.dart';

abstract class VendorPayableEvent extends Equatable {
  const VendorPayableEvent();

  @override
  List<Object> get props => [];
}

class VendorPayableSubmitted extends VendorPayableEvent {
  const VendorPayableSubmitted();
}
