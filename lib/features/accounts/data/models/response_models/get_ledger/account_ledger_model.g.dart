// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_ledger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountLedgerModel _$AccountLedgerModelFromJson(Map<String, dynamic> json) =>
    _AccountLedgerModel(
      finYearId: (json['FinYearId'] as num?)?.toInt(),
      ttlDebit: (json['TTLDebit'] as num?)?.toDouble(),
      ttlCredit: (json['TTLCredit'] as num?)?.toDouble(),
      balance: (json['Balance'] as num?)?.toDouble(),
      finYear: json['FinYear'] == null
          ? null
          : LedgerFinYear.fromJson(json['FinYear'] as Map<String, dynamic>),
      ledgerTypes: (json['LedgerTypes'] as List<dynamic>?)
          ?.map((e) => LedgerTypeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountLedgerModelToJson(_AccountLedgerModel instance) =>
    <String, dynamic>{
      'FinYearId': instance.finYearId,
      'TTLDebit': instance.ttlDebit,
      'TTLCredit': instance.ttlCredit,
      'Balance': instance.balance,
      'FinYear': instance.finYear,
      'LedgerTypes': instance.ledgerTypes,
    };

_LedgerFinYear _$LedgerFinYearFromJson(Map<String, dynamic> json) =>
    _LedgerFinYear(
      isClosed: json['IsClosed'] as bool?,
      startDate: json['StartDate'] as String?,
      endDate: json['EndDate'] as String?,
      name: json['Name'] as String?,
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LedgerFinYearToJson(_LedgerFinYear instance) =>
    <String, dynamic>{
      'IsClosed': instance.isClosed,
      'StartDate': instance.startDate,
      'EndDate': instance.endDate,
      'Name': instance.name,
      'Id': instance.id,
    };

_LedgerTypeModel _$LedgerTypeModelFromJson(Map<String, dynamic> json) =>
    _LedgerTypeModel(
      type: json['Type'] as String?,
      ttlDebit: (json['TTLDebit'] as num?)?.toDouble(),
      ttlCredit: (json['TTLCredit'] as num?)?.toDouble(),
      balance: (json['Balance'] as num?)?.toDouble(),
      ledgers: (json['Ledgers'] as List<dynamic>?)
          ?.map((e) => LedgerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LedgerTypeModelToJson(_LedgerTypeModel instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'TTLDebit': instance.ttlDebit,
      'TTLCredit': instance.ttlCredit,
      'Balance': instance.balance,
      'Ledgers': instance.ledgers,
      'Id': instance.id,
    };

_LedgerModel _$LedgerModelFromJson(Map<String, dynamic> json) => _LedgerModel(
  type: json['Type'] as String?,
  featureId: (json['FeatureId'] as num?)?.toInt(),
  parentEntityId: (json['ParentEntityId'] as num?)?.toInt(),
  docNbr: json['DocNbr'] as String?,
  docDate: json['DocDate'] as String?,
  accountId: (json['AccountId'] as num?)?.toInt(),
  featureName: json['FeatureName'] as String?,
  partyId: (json['PartyId'] as num?)?.toInt(),
  currencyId: (json['CurrencyId'] as num?)?.toInt(),
  drAmount: (json['DrAmount'] as num?)?.toDouble(),
  crAmount: (json['CrAmount'] as num?)?.toDouble(),
  narration: json['Narration'] as String?,
  isOpening: json['IsOpening'] as bool?,
  balance: (json['Balance'] as num?)?.toDouble(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$LedgerModelToJson(_LedgerModel instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'FeatureId': instance.featureId,
      'ParentEntityId': instance.parentEntityId,
      'DocNbr': instance.docNbr,
      'DocDate': instance.docDate,
      'AccountId': instance.accountId,
      'FeatureName': instance.featureName,
      'PartyId': instance.partyId,
      'CurrencyId': instance.currencyId,
      'DrAmount': instance.drAmount,
      'CrAmount': instance.crAmount,
      'Narration': instance.narration,
      'IsOpening': instance.isOpening,
      'Balance': instance.balance,
      'Id': instance.id,
    };
