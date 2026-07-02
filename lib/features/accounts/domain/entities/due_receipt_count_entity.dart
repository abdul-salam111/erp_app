import 'package:equatable/equatable.dart';
import 'recovery_invoice_entity.dart';

class DueReceiptCountEntity extends Equatable {
  final double ttlRecoveryAmount;
  final double ttlReceivedAmount;
  final double ttlPostponeAmount;
  final List<RecoveryInvoiceEntity> invoices;

  const DueReceiptCountEntity({
    required this.ttlRecoveryAmount,
    required this.ttlReceivedAmount,
    required this.ttlPostponeAmount,
    this.invoices = const [],
  });

  @override
  List<Object> get props => [
        ttlRecoveryAmount,
        ttlReceivedAmount,
        ttlPostponeAmount,
        invoices,
      ];
}
