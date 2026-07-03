import 'package:equatable/equatable.dart';

abstract class VendorPayableEvent extends Equatable {
  const VendorPayableEvent();

  @override
  List<Object> get props => [];
}

class VendorPayableSubmitted extends VendorPayableEvent {
  final String fromDate;
  final String toDate;

  const VendorPayableSubmitted({required this.fromDate, required this.toDate});

  @override
  List<Object> get props => [fromDate, toDate];
}
