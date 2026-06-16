// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'due_receipt_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DueReceiptCountModel _$DueReceiptCountModelFromJson(
  Map<String, dynamic> json,
) => _DueReceiptCountModel(
  ttlRecoveryAmount: (json['TTLRecoveryAmount'] as num?)?.toDouble() ?? 0,
  ttlReceivedAmount: (json['TTLReceivedAmount'] as num?)?.toDouble() ?? 0,
  ttlPostponeAmount: (json['TTLPostponeAmount'] as num?)?.toDouble() ?? 0,
);

Map<String, dynamic> _$DueReceiptCountModelToJson(
  _DueReceiptCountModel instance,
) => <String, dynamic>{
  'TTLRecoveryAmount': instance.ttlRecoveryAmount,
  'TTLReceivedAmount': instance.ttlReceivedAmount,
  'TTLPostponeAmount': instance.ttlPostponeAmount,
};
