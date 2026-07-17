import 'package:freezed_annotation/freezed_annotation.dart';
part 'sale_order_detail.freezed.dart';
part 'sale_order_detail.g.dart';

// Trimmed to the fields the create/edit sale order UI actually shows.

@freezed
abstract class SaleOrderDetail with _$SaleOrderDetail {
    const factory SaleOrderDetail({
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
        SaleDetailParty? party,
        @JsonKey(name: "Broker")
        SaleDetailBroker? broker,
        @JsonKey(name: "BrokerComissionOption")
        SaleNamedOption? brokerComissionOption,
        @JsonKey(name: "ModeOfPayment")
        SaleNamedOption? modeOfPayment,
        @JsonKey(name: "OrderSource")
        SaleNamedOption? orderSource,
        @JsonKey(name: "Rows")
        List<SaleDetailRow>? rows,
    }) = _SaleOrderDetail;

    factory SaleOrderDetail.fromJson(Map<String, dynamic> json) =>
        _$SaleOrderDetailFromJson(json);
}

@freezed
abstract class SaleDetailParty with _$SaleDetailParty {
    const factory SaleDetailParty({
        @JsonKey(name: "FullName")
        String? fullName,
        @JsonKey(name: "AccountId")
        int? accountId,
    }) = _SaleDetailParty;

    factory SaleDetailParty.fromJson(Map<String, dynamic> json) =>
        _$SaleDetailPartyFromJson(json);
}

@freezed
abstract class SaleDetailBroker with _$SaleDetailBroker {
    const factory SaleDetailBroker({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "FullName")
        String? fullName,
    }) = _SaleDetailBroker;

    factory SaleDetailBroker.fromJson(Map<String, dynamic> json) =>
        _$SaleDetailBrokerFromJson(json);
}

@freezed
abstract class SaleNamedOption with _$SaleNamedOption {
    const factory SaleNamedOption({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Name")
        String? name,
    }) = _SaleNamedOption;

    factory SaleNamedOption.fromJson(Map<String, dynamic> json) =>
        _$SaleNamedOptionFromJson(json);
}

@freezed
abstract class SaleDetailRow with _$SaleDetailRow {
    const factory SaleDetailRow({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Item")
        SaleDetailRowItem? item,
        @JsonKey(name: "ContractMode")
        SaleNamedOption? contractMode,
        @JsonKey(name: "Unit")
        SaleNamedOption? unit,
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
    }) = _SaleDetailRow;

    factory SaleDetailRow.fromJson(Map<String, dynamic> json) =>
        _$SaleDetailRowFromJson(json);
}

@freezed
abstract class SaleDetailRowItem with _$SaleDetailRowItem {
    const factory SaleDetailRowItem({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Name")
        String? name,
    }) = _SaleDetailRowItem;

    factory SaleDetailRowItem.fromJson(Map<String, dynamic> json) =>
        _$SaleDetailRowItemFromJson(json);
}
