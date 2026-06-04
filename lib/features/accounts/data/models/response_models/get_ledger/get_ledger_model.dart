import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_ledger_model.freezed.dart';
part 'get_ledger_model.g.dart';

@freezed
abstract class GetLedgerModel with _$GetLedgerModel {
    const factory GetLedgerModel({
        @JsonKey(name: "FinYearId")
        int? finYearId,
        @JsonKey(name: "TTLDebit")
        int? ttlDebit,
        @JsonKey(name: "TTLCredit")
        int? ttlCredit,
        @JsonKey(name: "Balance")
        int? balance,
        @JsonKey(name: "FinYear")
        FinYear? finYear,
        @JsonKey(name: "LedgerTypes")
        List<LedgerType>? ledgerTypes,
    }) = _GetLedgerModel;

    factory GetLedgerModel.fromJson(Map<String, dynamic> json) => _$GetLedgerModelFromJson(json);
}

@freezed
 abstract class FinYear with _$FinYear {
    const factory FinYear({
        @JsonKey(name: "IsClosed")
        bool? isClosed,
        @JsonKey(name: "StartDate")
        DateTime? startDate,
        @JsonKey(name: "EndDate")
        DateTime? endDate,
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "Id")
        int? id,
    }) = _FinYear;

    factory FinYear.fromJson(Map<String, dynamic> json) => _$FinYearFromJson(json);
}

@freezed
abstract class LedgerType with _$LedgerType {
    const factory LedgerType({
        @JsonKey(name: "Type")
        String? type,
        @JsonKey(name: "TTLDebit")
        int? ttlDebit,
        @JsonKey(name: "TTLCredit")
        int? ttlCredit,
        @JsonKey(name: "Balance")
        int? balance,
        @JsonKey(name: "Ledgers")
        List<Ledger>? ledgers,
    }) = _LedgerType;

    factory LedgerType.fromJson(Map<String, dynamic> json) => _$LedgerTypeFromJson(json);
}

@freezed
abstract class Ledger with _$Ledger {
    const factory Ledger({
        @JsonKey(name: "Type")
        String? type,
        @JsonKey(name: "FeatureId")
        int? featureId,
        @JsonKey(name: "DocDate")
        DateTime? docDate,
        @JsonKey(name: "AccountId")
        int? accountId,
        @JsonKey(name: "FinYearId")
        int? finYearId,
        @JsonKey(name: "CurrencyId")
        int? currencyId,
        @JsonKey(name: "DrAmount")
        int? drAmount,
        @JsonKey(name: "CrAmount")
        int? crAmount,
        @JsonKey(name: "Narration")
        String? narration,
        @JsonKey(name: "IsOpening")
        bool? isOpening,
        @JsonKey(name: "Balance")
        int? balance,
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "DocNbr")
        String? docNbr,
        @JsonKey(name: "ToAccountId")
        int? toAccountId,
        @JsonKey(name: "PartyId")
        int? partyId,
        @JsonKey(name: "Party")
        Party? party,
        @JsonKey(name: "FeatureName")
        String? featureName,
        @JsonKey(name: "ParentEntityId")
        int? parentEntityId,
        @JsonKey(name: "ChildEntityId")
        int? childEntityId,
    }) = _Ledger;

    factory Ledger.fromJson(Map<String, dynamic> json) => _$LedgerFromJson(json);
}

@freezed
abstract class Party with _$Party {
    const factory Party({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "FullName")
        String? fullName,
        @JsonKey(name: "PartyTypeId")
        int? partyTypeId,
        @JsonKey(name: "LocationId")
        int? locationId,
    }) = _Party;

    factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);
}
