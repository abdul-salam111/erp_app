// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaleOrderDetail _$SaleOrderDetailFromJson(
  Map<String, dynamic> json,
) => _SaleOrderDetail(
  id: (json['Id'] as num?)?.toInt(),
  docNbr: json['DocNbr'] as String?,
  docDate: json['DocDate'] == null
      ? null
      : DateTime.parse(json['DocDate'] as String),
  refDocNbr: json['RefDocNbr'] as String?,
  partyId: (json['PartyId'] as num?)?.toInt(),
  brokerId: (json['BrokerId'] as num?)?.toInt(),
  currencyId: (json['CurrencyId'] as num?)?.toInt(),
  currencyRate: (json['CurrencyRate'] as num?)?.toDouble(),
  brokerageOptionId: (json['BrokerageOptionId'] as num?)?.toInt(),
  brokerageOptionValue: (json['BrokerageOptionValue'] as num?)?.toDouble(),
  orderSourceId: (json['OrderSourceId'] as num?)?.toInt(),
  paymentModeId: (json['PaymentModeId'] as num?)?.toInt(),
  party: json['Party'] == null
      ? null
      : SaleDetailParty.fromJson(json['Party'] as Map<String, dynamic>),
  broker: json['Broker'] == null
      ? null
      : SaleDetailBroker.fromJson(json['Broker'] as Map<String, dynamic>),
  brokerComissionOption: json['BrokerComissionOption'] == null
      ? null
      : SaleNamedOption.fromJson(
          json['BrokerComissionOption'] as Map<String, dynamic>,
        ),
  modeOfPayment: json['ModeOfPayment'] == null
      ? null
      : SaleNamedOption.fromJson(json['ModeOfPayment'] as Map<String, dynamic>),
  orderSource: json['OrderSource'] == null
      ? null
      : SaleNamedOption.fromJson(json['OrderSource'] as Map<String, dynamic>),
  rows: (json['Rows'] as List<dynamic>?)
      ?.map((e) => SaleDetailRow.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SaleOrderDetailToJson(_SaleOrderDetail instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'DocNbr': instance.docNbr,
      'DocDate': instance.docDate?.toIso8601String(),
      'RefDocNbr': instance.refDocNbr,
      'PartyId': instance.partyId,
      'BrokerId': instance.brokerId,
      'CurrencyId': instance.currencyId,
      'CurrencyRate': instance.currencyRate,
      'BrokerageOptionId': instance.brokerageOptionId,
      'BrokerageOptionValue': instance.brokerageOptionValue,
      'OrderSourceId': instance.orderSourceId,
      'PaymentModeId': instance.paymentModeId,
      'Party': instance.party,
      'Broker': instance.broker,
      'BrokerComissionOption': instance.brokerComissionOption,
      'ModeOfPayment': instance.modeOfPayment,
      'OrderSource': instance.orderSource,
      'Rows': instance.rows,
    };

_SaleDetailParty _$SaleDetailPartyFromJson(Map<String, dynamic> json) =>
    _SaleDetailParty(
      fullName: json['FullName'] as String?,
      accountId: (json['AccountId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SaleDetailPartyToJson(_SaleDetailParty instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'AccountId': instance.accountId,
    };

_SaleDetailBroker _$SaleDetailBrokerFromJson(Map<String, dynamic> json) =>
    _SaleDetailBroker(
      id: (json['Id'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
    );

Map<String, dynamic> _$SaleDetailBrokerToJson(_SaleDetailBroker instance) =>
    <String, dynamic>{'Id': instance.id, 'FullName': instance.fullName};

_SaleNamedOption _$SaleNamedOptionFromJson(Map<String, dynamic> json) =>
    _SaleNamedOption(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$SaleNamedOptionToJson(_SaleNamedOption instance) =>
    <String, dynamic>{'Id': instance.id, 'Name': instance.name};

_SaleDetailRow _$SaleDetailRowFromJson(Map<String, dynamic> json) =>
    _SaleDetailRow(
      id: (json['Id'] as num?)?.toInt(),
      item: json['Item'] == null
          ? null
          : SaleDetailRowItem.fromJson(json['Item'] as Map<String, dynamic>),
      contractMode: json['ContractMode'] == null
          ? null
          : SaleNamedOption.fromJson(
              json['ContractMode'] as Map<String, dynamic>,
            ),
      unit: json['Unit'] == null
          ? null
          : SaleNamedOption.fromJson(json['Unit'] as Map<String, dynamic>),
      qtyPack: (json['QtyPack'] as num?)?.toDouble(),
      pricePack: (json['PricePack'] as num?)?.toDouble(),
      weightPriceUnit: (json['WeightPriceUnit'] as num?)?.toDouble(),
      ttlDisc: (json['TTLDisc'] as num?)?.toDouble(),
      taxAmount: (json['TaxAmount'] as num?)?.toDouble(),
      subTotal: (json['SubTotal'] as num?)?.toDouble(),
      rowTotal: (json['RowTotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SaleDetailRowToJson(_SaleDetailRow instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Item': instance.item,
      'ContractMode': instance.contractMode,
      'Unit': instance.unit,
      'QtyPack': instance.qtyPack,
      'PricePack': instance.pricePack,
      'WeightPriceUnit': instance.weightPriceUnit,
      'TTLDisc': instance.ttlDisc,
      'TaxAmount': instance.taxAmount,
      'SubTotal': instance.subTotal,
      'RowTotal': instance.rowTotal,
    };

_SaleDetailRowItem _$SaleDetailRowItemFromJson(Map<String, dynamic> json) =>
    _SaleDetailRowItem(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$SaleDetailRowItemToJson(_SaleDetailRowItem instance) =>
    <String, dynamic>{'Id': instance.id, 'Name': instance.name};
