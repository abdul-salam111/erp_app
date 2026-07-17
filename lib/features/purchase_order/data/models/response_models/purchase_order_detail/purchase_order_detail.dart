import 'package:freezed_annotation/freezed_annotation.dart';
part 'purchase_order_detail.freezed.dart';
part 'purchase_order_detail.g.dart';

// Trimmed to the fields the create/edit purchase order UI actually shows.

@freezed
abstract class PurchaseOrderDetail with _$PurchaseOrderDetail {
    const factory PurchaseOrderDetail({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "DocNbr")
        String? docNbr,
        @JsonKey(name: "DocDate")
        DateTime? docDate,
        @JsonKey(name: "RefDocNbr")
        String? refDocNbr,
        @JsonKey(name: "PartyId")
        int? partyId,
        @JsonKey(name: "BrokerId")
        int? brokerId,
        @JsonKey(name: "CurrencyId")
        int? currencyId,
        @JsonKey(name: "CurrencyRate")
        double? currencyRate,
        @JsonKey(name: "BrokerageOptionId")
        int? brokerageOptionId,
        @JsonKey(name: "BrokerageOptionValue")
        double? brokerageOptionValue,
        @JsonKey(name: "OrderSourceId")
        int? orderSourceId,
        @JsonKey(name: "PaymentModeId")
        int? paymentModeId,
        @JsonKey(name: "Party")
        DetailParty? party,
        @JsonKey(name: "Broker")
        DetailBroker? broker,
        @JsonKey(name: "BrokerComissionOption")
        NamedOption? brokerComissionOption,
        @JsonKey(name: "ModeOfPayment")
        NamedOption? modeOfPayment,
        @JsonKey(name: "OrderSource")
        NamedOption? orderSource,
        @JsonKey(name: "Rows")
        List<DetailRow>? rows,
    }) = _PurchaseOrderDetail;

    factory PurchaseOrderDetail.fromJson(Map<String, dynamic> json) =>
        _$PurchaseOrderDetailFromJson(json);
}

@freezed
abstract class DetailParty with _$DetailParty {
    const factory DetailParty({
        @JsonKey(name: "FullName")
        String? fullName,
        @JsonKey(name: "AccountId")
        int? accountId,
    }) = _DetailParty;

    factory DetailParty.fromJson(Map<String, dynamic> json) =>
        _$DetailPartyFromJson(json);
}

@freezed
abstract class DetailBroker with _$DetailBroker {
    const factory DetailBroker({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "FullName")
        String? fullName,
    }) = _DetailBroker;

    factory DetailBroker.fromJson(Map<String, dynamic> json) =>
        _$DetailBrokerFromJson(json);
}

@freezed
abstract class NamedOption with _$NamedOption {
    const factory NamedOption({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Name")
        String? name,
    }) = _NamedOption;

    factory NamedOption.fromJson(Map<String, dynamic> json) =>
        _$NamedOptionFromJson(json);
}

@freezed
abstract class DetailRow with _$DetailRow {
    const factory DetailRow({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Item")
        DetailRowItem? item,
        @JsonKey(name: "ContractMode")
        NamedOption? contractMode,
        @JsonKey(name: "Unit")
        NamedOption? unit,
        @JsonKey(name: "QtyPack")
        double? qtyPack,
        @JsonKey(name: "PricePack")
        double? pricePack,
        @JsonKey(name: "WeightPriceUnit")
        double? weightPriceUnit,
        @JsonKey(name: "TTLDisc")
        double? ttlDisc,
        @JsonKey(name: "TaxAmount")
        double? taxAmount,
        @JsonKey(name: "SubTotal")
        double? subTotal,
        @JsonKey(name: "RowTotal")
        double? rowTotal,
    }) = _DetailRow;

    factory DetailRow.fromJson(Map<String, dynamic> json) =>
        _$DetailRowFromJson(json);
}

@freezed
abstract class DetailRowItem with _$DetailRowItem {
    const factory DetailRowItem({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Name")
        String? name,
    }) = _DetailRowItem;

    factory DetailRowItem.fromJson(Map<String, dynamic> json) =>
        _$DetailRowItemFromJson(json);
}
