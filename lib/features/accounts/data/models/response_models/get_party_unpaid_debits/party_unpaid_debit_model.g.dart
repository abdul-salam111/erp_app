// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party_unpaid_debit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartyUnpaidDebitModel _$PartyUnpaidDebitModelFromJson(
  Map<String, dynamic> json,
) => _PartyUnpaidDebitModel(
  debitId: (json['DebitId'] as num).toInt(),
  partyId: (json['PartyId'] as num).toInt(),
  docNbr: json['DocNbr'] as String? ?? '',
  docDate: json['DocDate'] as String? ?? '',
  referenceDate: json['RefrenceDate'] as String? ?? '',
  totalAmount: (json['TotalAmount'] as num?)?.toDouble() ?? 0.0,
  allocatedAmount: (json['AllocatedAmount'] as num?)?.toDouble() ?? 0.0,
  remainingAmount: (json['RemainingAmount'] as num?)?.toDouble() ?? 0.0,
  markupAmount: (json['MarkupAmount'] as num?)?.toDouble() ?? 0.0,
  daysOverdue: (json['DaysOverdue'] as num?)?.toInt() ?? 0,
  status: json['Status'] as String? ?? '',
);

Map<String, dynamic> _$PartyUnpaidDebitModelToJson(
  _PartyUnpaidDebitModel instance,
) => <String, dynamic>{
  'DebitId': instance.debitId,
  'PartyId': instance.partyId,
  'DocNbr': instance.docNbr,
  'DocDate': instance.docDate,
  'RefrenceDate': instance.referenceDate,
  'TotalAmount': instance.totalAmount,
  'AllocatedAmount': instance.allocatedAmount,
  'RemainingAmount': instance.remainingAmount,
  'MarkupAmount': instance.markupAmount,
  'DaysOverdue': instance.daysOverdue,
  'Status': instance.status,
};
