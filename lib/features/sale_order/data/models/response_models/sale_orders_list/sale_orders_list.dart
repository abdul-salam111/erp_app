import 'package:freezed_annotation/freezed_annotation.dart';
part 'sale_orders_list.freezed.dart';
part 'sale_orders_list.g.dart';

// Trimmed to the fields the sale orders list UI actually shows.

@freezed
abstract class SaleOrdersList with _$SaleOrdersList {
    const factory SaleOrdersList({
        @JsonKey(name: "Data")
        List<SaleOrderDatum>? data,
    }) = _SaleOrdersList;

    factory SaleOrdersList.fromJson(Map<String, dynamic> json) =>
        _$SaleOrdersListFromJson(json);
}

@freezed
abstract class SaleOrderDatum with _$SaleOrderDatum {
    const factory SaleOrderDatum({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Party")
        SaleOrderParty? party,
        @JsonKey(name: "FirstRow")
        SaleOrderFirstRow? firstRow,
        @JsonKey(name: "DocDate")
        DateTime? docDate,
        @JsonKey(name: "DocNbr")
        String? docNbr,
        @JsonKey(name: "RefDocNbr")
        String? refDocNbr,
        @JsonKey(name: "TTLNetAmount")
        double? ttlNetAmount,
        @JsonKey(name: "TTLRows")
        int? ttlRows,
    }) = _SaleOrderDatum;

    factory SaleOrderDatum.fromJson(Map<String, dynamic> json) =>
        _$SaleOrderDatumFromJson(json);
}

@freezed
abstract class SaleOrderFirstRow with _$SaleOrderFirstRow {
    const factory SaleOrderFirstRow({
        @JsonKey(name: "ItemName")
        String? itemName,
    }) = _SaleOrderFirstRow;

    factory SaleOrderFirstRow.fromJson(Map<String, dynamic> json) =>
        _$SaleOrderFirstRowFromJson(json);
}

@freezed
abstract class SaleOrderParty with _$SaleOrderParty {
    const factory SaleOrderParty({
        @JsonKey(name: "FullName")
        String? fullName,
        @JsonKey(name: "AccountId")
        int? accountId,
    }) = _SaleOrderParty;

    factory SaleOrderParty.fromJson(Map<String, dynamic> json) =>
        _$SaleOrderPartyFromJson(json);
}
