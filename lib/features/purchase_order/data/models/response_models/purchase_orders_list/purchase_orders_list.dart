import 'package:freezed_annotation/freezed_annotation.dart';
part 'purchase_orders_list.freezed.dart';
part 'purchase_orders_list.g.dart';

@freezed
abstract class PurchaseOrdersList with _$PurchaseOrdersList {
    const factory PurchaseOrdersList({
        @JsonKey(name: "Data")
        List<Datum>? data,
    }) = _PurchaseOrdersList;

    factory PurchaseOrdersList.fromJson(Map<String, dynamic> json) => _$PurchaseOrdersListFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
    const factory Datum({
        @JsonKey(name: "Party")
        Party? party,
        @JsonKey(name: "FirstRow")
        FirstRow? firstRow,
        @JsonKey(name: "DocDate")
        DateTime? docDate,
        @JsonKey(name: "FeatureId")
        int? featureId,
        @JsonKey(name: "DocNbr")
        String? docNbr,
        @JsonKey(name: "RefDocNbr")
        String? refDocNbr,
        @JsonKey(name: "DueDate")
        DateTime? dueDate,
        @JsonKey(name: "TTLSubTotal")
        double? ttlSubTotal,
        @JsonKey(name: "TTLTaxAmount")
        double? ttlTaxAmount,
        @JsonKey(name: "TTLNetAmount")
        double? ttlNetAmount,
        @JsonKey(name: "TTLRows")
        int? ttlRows,
        @JsonKey(name: "TTLAttachments")
        int? ttlAttachments,
        @JsonKey(name: "EnumPrintStatusId")
        int? enumPrintStatusId,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
abstract class FirstRow with _$FirstRow {
    const factory FirstRow({
        @JsonKey(name: "ItemName")
        String? itemName,
    }) = _FirstRow;

    factory FirstRow.fromJson(Map<String, dynamic> json) => _$FirstRowFromJson(json);
}

@freezed
abstract class Party with _$Party {
    const factory Party({
        @JsonKey(name: "FullName")
        String? fullName,
        @JsonKey(name: "AccountId")
        int? accountId,
    }) = _Party;

    factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);
}
