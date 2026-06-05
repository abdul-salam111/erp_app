// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_cash_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BankCashItemModel _$BankCashItemModelFromJson(Map<String, dynamic> json) =>
    _BankCashItemModel(
      accountId: (json['AccountId'] as num).toInt(),
      accountTitle: json['AccountTitle'] as String? ?? '',
      accountType: json['AccountType'] as String? ?? '',
      accountNbr: json['AccountNbr'] as String? ?? '',
      amount: (json['Amount'] as num).toDouble(),
    );

Map<String, dynamic> _$BankCashItemModelToJson(_BankCashItemModel instance) =>
    <String, dynamic>{
      'AccountId': instance.accountId,
      'AccountTitle': instance.accountTitle,
      'AccountType': instance.accountType,
      'AccountNbr': instance.accountNbr,
      'Amount': instance.amount,
    };
