import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_ledger_model.freezed.dart';
part 'account_ledger_model.g.dart';

@freezed
abstract class AccountLedgerModel with _$AccountLedgerModel {
  const factory AccountLedgerModel({
    @JsonKey(name: 'FinYearId') int? finYearId,
    @JsonKey(name: 'TTLDebit') double? ttlDebit,
    @JsonKey(name: 'TTLCredit') double? ttlCredit,
    @JsonKey(name: 'Balance') double? balance,
    @JsonKey(name: 'FinYear') LedgerFinYear? finYear,
    @JsonKey(name: 'LedgerTypes') List<LedgerTypeModel>? ledgerTypes,
  }) = _AccountLedgerModel;

  factory AccountLedgerModel.fromJson(Map<String, dynamic> json) =>
      _$AccountLedgerModelFromJson(json);
}

@freezed
abstract class LedgerFinYear with _$LedgerFinYear {
  const factory LedgerFinYear({
    @JsonKey(name: 'IsClosed') bool? isClosed,
    @JsonKey(name: 'StartDate') String? startDate,
    @JsonKey(name: 'EndDate') String? endDate,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Id') int? id,
  }) = _LedgerFinYear;

  factory LedgerFinYear.fromJson(Map<String, dynamic> json) =>
      _$LedgerFinYearFromJson(json);
}

@freezed
abstract class LedgerTypeModel with _$LedgerTypeModel {
  const factory LedgerTypeModel({
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'TTLDebit') double? ttlDebit,
    @JsonKey(name: 'TTLCredit') double? ttlCredit,
    @JsonKey(name: 'Balance') double? balance,
    @JsonKey(name: 'Ledgers') List<LedgerModel>? ledgers,
    @JsonKey(name: 'Id') int? id,
  }) = _LedgerTypeModel;

  factory LedgerTypeModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerTypeModelFromJson(json);
}

@freezed
abstract class LedgerModel with _$LedgerModel {
  const factory LedgerModel({
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'FeatureId') int? featureId,
    @JsonKey(name: 'ParentEntityId') int? parentEntityId,
    @JsonKey(name: 'DocNbr') String? docNbr,
    @JsonKey(name: 'DocDate') String? docDate,
    @JsonKey(name: 'AccountId') int? accountId,
    @JsonKey(name: 'FeatureName') String? featureName,
    @JsonKey(name: 'PartyId') int? partyId,
    @JsonKey(name: 'CurrencyId') int? currencyId,
    @JsonKey(name: 'DrAmount') double? drAmount,
    @JsonKey(name: 'CrAmount') double? crAmount,
    @JsonKey(name: 'Narration') String? narration,
    @JsonKey(name: 'IsOpening') bool? isOpening,
    @JsonKey(name: 'Balance') double? balance,
    @JsonKey(name: 'Id') int? id,
  }) = _LedgerModel;

  factory LedgerModel.fromJson(Map<String, dynamic> json) =>
      _$LedgerModelFromJson(json);
}
