import 'package:freezed_annotation/freezed_annotation.dart';

part 'cashbook_model.freezed.dart';
part 'cashbook_model.g.dart';

@freezed
abstract class CashbookModel with _$CashbookModel {
  const factory CashbookModel({
    @JsonKey(name: 'FinYearId') int? finYearId,
    @JsonKey(name: 'TTLDebit') int? ttlDebit,
    @JsonKey(name: 'TTLCredit') int? ttlCredit,
    @JsonKey(name: 'Balance') int? balance,
    @JsonKey(name: 'FinYear') CashbookFinYearModel? finYear,
    @JsonKey(name: 'LedgerTypes') List<CashbookTypeModel>? ledgerTypes,
  }) = _CashbookModel;

  factory CashbookModel.fromJson(Map<String, dynamic> json) =>
      _$CashbookModelFromJson(json);
}

@freezed
abstract class CashbookFinYearModel with _$CashbookFinYearModel {
  const factory CashbookFinYearModel({
    @JsonKey(name: 'IsClosed') bool? isClosed,
    @JsonKey(name: 'StartDate') DateTime? startDate,
    @JsonKey(name: 'EndDate') DateTime? endDate,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Id') int? id,
  }) = _CashbookFinYearModel;

  factory CashbookFinYearModel.fromJson(Map<String, dynamic> json) =>
      _$CashbookFinYearModelFromJson(json);
}

@freezed
abstract class CashbookTypeModel with _$CashbookTypeModel {
  const factory CashbookTypeModel({
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'TTLDebit') int? ttlDebit,
    @JsonKey(name: 'TTLCredit') int? ttlCredit,
    @JsonKey(name: 'Balance') int? balance,
    @JsonKey(name: 'Ledgers') List<CashbookEntryModel>? ledgers,
  }) = _CashbookTypeModel;

  factory CashbookTypeModel.fromJson(Map<String, dynamic> json) =>
      _$CashbookTypeModelFromJson(json);
}

@freezed
abstract class CashbookEntryModel with _$CashbookEntryModel {
  const factory CashbookEntryModel({
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'FeatureId') int? featureId,
    @JsonKey(name: 'DocDate') DateTime? docDate,
    @JsonKey(name: 'AccountId') int? accountId,
    @JsonKey(name: 'FinYearId') int? finYearId,
    @JsonKey(name: 'CurrencyId') int? currencyId,
    @JsonKey(name: 'DrAmount') int? drAmount,
    @JsonKey(name: 'CrAmount') int? crAmount,
    @JsonKey(name: 'Narration') String? narration,
    @JsonKey(name: 'IsOpening') bool? isOpening,
    @JsonKey(name: 'Balance') int? balance,
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'DocNbr') String? docNbr,
    @JsonKey(name: 'ToAccountId') int? toAccountId,
    @JsonKey(name: 'PartyId') int? partyId,
    @JsonKey(name: 'Party') CashbookPartyModel? party,
    @JsonKey(name: 'FeatureName') String? featureName,
    @JsonKey(name: 'ParentEntityId') int? parentEntityId,
    @JsonKey(name: 'ChildEntityId') int? childEntityId,
  }) = _CashbookEntryModel;

  factory CashbookEntryModel.fromJson(Map<String, dynamic> json) =>
      _$CashbookEntryModelFromJson(json);
}

@freezed
abstract class CashbookPartyModel with _$CashbookPartyModel {
  const factory CashbookPartyModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'PartyTypeId') int? partyTypeId,
    @JsonKey(name: 'LocationId') int? locationId,
  }) = _CashbookPartyModel;

  factory CashbookPartyModel.fromJson(Map<String, dynamic> json) =>
      _$CashbookPartyModelFromJson(json);
}
