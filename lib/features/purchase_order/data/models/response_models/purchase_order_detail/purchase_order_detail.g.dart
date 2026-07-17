// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseOrderDetail _$PurchaseOrderDetailFromJson(Map<String, dynamic> json) =>
    _PurchaseOrderDetail(
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
          : DetailParty.fromJson(json['Party'] as Map<String, dynamic>),
      broker: json['Broker'] == null
          ? null
          : DetailBroker.fromJson(json['Broker'] as Map<String, dynamic>),
      brokerComissionOption: json['BrokerComissionOption'] == null
          ? null
          : NamedOption.fromJson(
              json['BrokerComissionOption'] as Map<String, dynamic>,
            ),
      modeOfPayment: json['ModeOfPayment'] == null
          ? null
          : NamedOption.fromJson(json['ModeOfPayment'] as Map<String, dynamic>),
      orderSource: json['OrderSource'] == null
          ? null
          : NamedOption.fromJson(json['OrderSource'] as Map<String, dynamic>),
      rows: (json['Rows'] as List<dynamic>?)
          ?.map((e) => DetailRow.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PurchaseOrderDetailToJson(
  _PurchaseOrderDetail instance,
) => <String, dynamic>{
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

_DetailParty _$DetailPartyFromJson(Map<String, dynamic> json) => _DetailParty(
  fullName: json['FullName'] as String?,
  accountId: (json['AccountId'] as num?)?.toInt(),
);

Map<String, dynamic> _$DetailPartyToJson(_DetailParty instance) =>
    <String, dynamic>{
      'FullName': instance.fullName,
      'AccountId': instance.accountId,
    };

_DetailBroker _$DetailBrokerFromJson(Map<String, dynamic> json) =>
    _DetailBroker(
      id: (json['Id'] as num?)?.toInt(),
      fullName: json['FullName'] as String?,
    );

Map<String, dynamic> _$DetailBrokerToJson(_DetailBroker instance) =>
    <String, dynamic>{'Id': instance.id, 'FullName': instance.fullName};

_NamedOption _$NamedOptionFromJson(Map<String, dynamic> json) => _NamedOption(
  id: (json['Id'] as num?)?.toInt(),
  name: json['Name'] as String?,
);

Map<String, dynamic> _$NamedOptionToJson(_NamedOption instance) =>
    <String, dynamic>{'Id': instance.id, 'Name': instance.name};

_DetailRow _$DetailRowFromJson(Map<String, dynamic> json) => _DetailRow(
  id: (json['Id'] as num?)?.toInt(),
  item: json['Item'] == null
      ? null
      : DetailRowItem.fromJson(json['Item'] as Map<String, dynamic>),
  contractMode: json['ContractMode'] == null
      ? null
      : NamedOption.fromJson(json['ContractMode'] as Map<String, dynamic>),
  unit: json['Unit'] == null
      ? null
      : NamedOption.fromJson(json['Unit'] as Map<String, dynamic>),
  qtyPack: (json['QtyPack'] as num?)?.toDouble(),
  pricePack: (json['PricePack'] as num?)?.toDouble(),
  weightPriceUnit: (json['WeightPriceUnit'] as num?)?.toDouble(),
  ttlDisc: (json['TTLDisc'] as num?)?.toDouble(),
  taxAmount: (json['TaxAmount'] as num?)?.toDouble(),
  subTotal: (json['SubTotal'] as num?)?.toDouble(),
  rowTotal: (json['RowTotal'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DetailRowToJson(_DetailRow instance) =>
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

_DetailRowItem _$DetailRowItemFromJson(Map<String, dynamic> json) =>
    _DetailRowItem(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$DetailRowItemToJson(_DetailRowItem instance) =>
    <String, dynamic>{'Id': instance.id, 'Name': instance.name};
