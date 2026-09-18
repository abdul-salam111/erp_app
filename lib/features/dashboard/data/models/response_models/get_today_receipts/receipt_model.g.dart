// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) =>
    _ReceiptModel(
      id: (json['Id'] as num?)?.toInt(),
      docNbr: json['DocNbr'] as String?,
      docDate: json['DocDate'] == null
          ? null
          : DateTime.parse(json['DocDate'] as String),
      mode: json['Mode'] as String?,
      ttlNetAmount: (json['TTLNetAmount'] as num?)?.toDouble(),
      account: json['Account'] == null
          ? null
          : ReceiptAccount.fromJson(json['Account'] as Map<String, dynamic>),
      party: json['Party'] == null
          ? null
          : ReceiptParty.fromJson(json['Party'] as Map<String, dynamic>),
      currency: json['Currency'] == null
          ? null
          : ReceiptCurrency.fromJson(json['Currency'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReceiptModelToJson(_ReceiptModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'DocNbr': instance.docNbr,
      'DocDate': instance.docDate?.toIso8601String(),
      'Mode': instance.mode,
      'TTLNetAmount': instance.ttlNetAmount,
      'Account': instance.account,
      'Party': instance.party,
      'Currency': instance.currency,
    };

_ReceiptAccount _$ReceiptAccountFromJson(Map<String, dynamic> json) =>
    _ReceiptAccount(name: json['Name'] as String?);

Map<String, dynamic> _$ReceiptAccountToJson(_ReceiptAccount instance) =>
    <String, dynamic>{'Name': instance.name};

_ReceiptParty _$ReceiptPartyFromJson(Map<String, dynamic> json) =>
    _ReceiptParty(fullName: json['FullName'] as String?);

Map<String, dynamic> _$ReceiptPartyToJson(_ReceiptParty instance) =>
    <String, dynamic>{'FullName': instance.fullName};

_ReceiptCurrency _$ReceiptCurrencyFromJson(Map<String, dynamic> json) =>
    _ReceiptCurrency(symbol: json['Symbol'] as String?);

Map<String, dynamic> _$ReceiptCurrencyToJson(_ReceiptCurrency instance) =>
    <String, dynamic>{'Symbol': instance.symbol};
