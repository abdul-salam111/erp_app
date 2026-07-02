import 'recovery_invoice_model.dart';

class DueReceiptCountModel {
  final double ttlRecoveryAmount;
  final double ttlReceivedAmount;
  final double ttlPostponeAmount;
  final List<RecoveryInvoiceModel> invoices;

  const DueReceiptCountModel({
    this.ttlRecoveryAmount = 0,
    this.ttlReceivedAmount = 0,
    this.ttlPostponeAmount = 0,
    this.invoices = const [],
  });

  factory DueReceiptCountModel.fromJson(Map<String, dynamic> json) =>
      DueReceiptCountModel(
        ttlRecoveryAmount:
            (json['TTLRecoveryAmount'] as num?)?.toDouble() ?? 0,
        ttlReceivedAmount:
            (json['TTLReceivedAmount'] as num?)?.toDouble() ?? 0,
        ttlPostponeAmount:
            (json['TTLPostponeAmount'] as num?)?.toDouble() ?? 0,
        invoices: (json['Invoices'] as List<dynamic>?)
                ?.map(
                  (e) => RecoveryInvoiceModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList() ??
            const [],
      );
}
