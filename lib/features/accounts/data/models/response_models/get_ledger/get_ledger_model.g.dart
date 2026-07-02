// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_ledger_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetLedgerModel _$GetLedgerModelFromJson(Map<String, dynamic> json) =>
    _GetLedgerModel(
      finYearId: (json['FinYearId'] as num?)?.toInt(),
      ttlDebit: (json['TTLDebit'] as num?)?.toDouble(),
      ttlCredit: (json['TTLCredit'] as num?)?.toDouble(),
      balance: (json['Balance'] as num?)?.toDouble(),
      finYear: json['FinYear'] == null
          ? null
          : FinYear.fromJson(json['FinYear'] as Map<String, dynamic>),
      ledgerTypes: (json['LedgerTypes'] as List<dynamic>?)
          ?.map((e) => LedgerType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetLedgerModelToJson(_GetLedgerModel instance) =>
    <String, dynamic>{
      'FinYearId': instance.finYearId,
      'TTLDebit': instance.ttlDebit,
      'TTLCredit': instance.ttlCredit,
      'Balance': instance.balance,
      'FinYear': instance.finYear,
      'LedgerTypes': instance.ledgerTypes,
    };

_FinYear _$FinYearFromJson(Map<String, dynamic> json) => _FinYear(
  isClosed: json['IsClosed'] as bool?,
  startDate: json['StartDate'] == null
      ? null
      : DateTime.parse(json['StartDate'] as String),
  endDate: json['EndDate'] == null
      ? null
      : DateTime.parse(json['EndDate'] as String),
  name: json['Name'] as String?,
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$FinYearToJson(_FinYear instance) => <String, dynamic>{
  'IsClosed': instance.isClosed,
  'StartDate': instance.startDate?.toIso8601String(),
  'EndDate': instance.endDate?.toIso8601String(),
  'Name': instance.name,
  'Id': instance.id,
};

_LedgerType _$LedgerTypeFromJson(Map<String, dynamic> json) => _LedgerType(
  type: json['Type'] as String?,
  ttlDebit: (json['TTLDebit'] as num?)?.toDouble(),
  ttlCredit: (json['TTLCredit'] as num?)?.toDouble(),
  balance: (json['Balance'] as num?)?.toDouble(),
  ledgers: (json['Ledgers'] as List<dynamic>?)
      ?.map((e) => Ledger.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$LedgerTypeToJson(_LedgerType instance) =>
    <String, dynamic>{
      'Type': instance.type,
      'TTLDebit': instance.ttlDebit,
      'TTLCredit': instance.ttlCredit,
      'Balance': instance.balance,
      'Ledgers': instance.ledgers,
    };

_Ledger _$LedgerFromJson(Map<String, dynamic> json) => _Ledger(
  type: json['Type'] as String?,
  featureId: (json['FeatureId'] as num?)?.toInt(),
  feature: json['Feature'] == null
      ? null
      : LedgerFeatureModel.fromJson(json['Feature'] as Map<String, dynamic>),
  docDate: json['DocDate'] == null
      ? null
      : DateTime.parse(json['DocDate'] as String),
  accountId: (json['AccountId'] as num?)?.toInt(),
  finYearId: (json['FinYearId'] as num?)?.toInt(),
  currencyId: (json['CurrencyId'] as num?)?.toInt(),
  drAmount: (json['DrAmount'] as num?)?.toDouble(),
  crAmount: (json['CrAmount'] as num?)?.toDouble(),
  taxAmount: (json['TaxAmount'] as num?)?.toDouble(),
  narration: json['Narration'] as String?,
  isOpening: json['IsOpening'] as bool?,
  balance: (json['Balance'] as num?)?.toDouble(),
  id: (json['Id'] as num?)?.toInt(),
  docNbr: json['DocNbr'] as String?,
  toAccountId: (json['ToAccountId'] as num?)?.toInt(),
  partyId: (json['PartyId'] as num?)?.toInt(),
  party: json['Party'] == null
      ? null
      : Party.fromJson(json['Party'] as Map<String, dynamic>),
  featureName: json['FeatureName'] as String?,
  parentEntityId: (json['ParentEntityId'] as num?)?.toInt(),
  childEntityId: (json['ChildEntityId'] as num?)?.toInt(),
);

Map<String, dynamic> _$LedgerToJson(_Ledger instance) => <String, dynamic>{
  'Type': instance.type,
  'FeatureId': instance.featureId,
  'Feature': instance.feature,
  'DocDate': instance.docDate?.toIso8601String(),
  'AccountId': instance.accountId,
  'FinYearId': instance.finYearId,
  'CurrencyId': instance.currencyId,
  'DrAmount': instance.drAmount,
  'CrAmount': instance.crAmount,
  'TaxAmount': instance.taxAmount,
  'Narration': instance.narration,
  'IsOpening': instance.isOpening,
  'Balance': instance.balance,
  'Id': instance.id,
  'DocNbr': instance.docNbr,
  'ToAccountId': instance.toAccountId,
  'PartyId': instance.partyId,
  'Party': instance.party,
  'FeatureName': instance.featureName,
  'ParentEntityId': instance.parentEntityId,
  'ChildEntityId': instance.childEntityId,
};

_LedgerFeatureModel _$LedgerFeatureModelFromJson(Map<String, dynamic> json) =>
    _LedgerFeatureModel(
      name: json['Name'] as String?,
      sysKey: json['SysKey'] as String?,
      finDisplayOrder: (json['FinDisplayOrder'] as num?)?.toInt(),
      stockDisplayOrder: (json['StockDisplayOrder'] as num?)?.toInt(),
      flgLandingPage: json['FlgLandingPage'] as bool?,
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LedgerFeatureModelToJson(_LedgerFeatureModel instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'SysKey': instance.sysKey,
      'FinDisplayOrder': instance.finDisplayOrder,
      'StockDisplayOrder': instance.stockDisplayOrder,
      'FlgLandingPage': instance.flgLandingPage,
      'Id': instance.id,
    };

_Party _$PartyFromJson(Map<String, dynamic> json) => _Party(
  id: (json['Id'] as num?)?.toInt(),
  fullName: json['FullName'] as String?,
  partyTypeId: (json['PartyTypeId'] as num?)?.toInt(),
  locationId: (json['LocationId'] as num?)?.toInt(),
);

Map<String, dynamic> _$PartyToJson(_Party instance) => <String, dynamic>{
  'Id': instance.id,
  'FullName': instance.fullName,
  'PartyTypeId': instance.partyTypeId,
  'LocationId': instance.locationId,
};
