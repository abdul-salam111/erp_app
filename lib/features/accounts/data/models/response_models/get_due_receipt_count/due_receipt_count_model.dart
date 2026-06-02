class DueReceiptCountModel {
  final double ttlRecoveryAmount;
  final double ttlReceivedAmount;
  final double ttlPostponeAmount;

  const DueReceiptCountModel({
    required this.ttlRecoveryAmount,
    required this.ttlReceivedAmount,
    required this.ttlPostponeAmount,
  });

  factory DueReceiptCountModel.fromJson(Map<String, dynamic> json) =>
      DueReceiptCountModel(
        ttlRecoveryAmount:
            (json['TTLRecoveryAmount'] as num?)?.toDouble() ?? 0,
        ttlReceivedAmount:
            (json['TTLReceivedAmount'] as num?)?.toDouble() ?? 0,
        ttlPostponeAmount:
            (json['TTLPostponeAmount'] as num?)?.toDouble() ?? 0,
      );
}
