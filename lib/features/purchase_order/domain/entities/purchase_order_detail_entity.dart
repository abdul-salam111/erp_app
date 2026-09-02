import 'package:equatable/equatable.dart';

class PurchaseOrderDetailEntity extends Equatable {
  final String? docNbr;
  final DateTime? docDate;
  final String? refDocNbr;
  final int? partyId;
  final int? brokerId;
  final int? currencyId;
  final double? currencyRate;
  final int? brokerageOptionId;
  final double? brokerageOptionValue;
  final int? orderSourceId;
  final int? paymentModeId;
  final String? partyName;
  final String? brokerName;
  final String? paymentModeName;
  final String? orderSourceName;
  final String? brokerCommissionOptionName;
  final List<PurchaseOrderDetailRowEntity> rows;

  const PurchaseOrderDetailEntity({
    this.docNbr,
    this.docDate,
    this.refDocNbr,
    this.partyId,
    this.brokerId,
    this.currencyId,
    this.currencyRate,
    this.brokerageOptionId,
    this.brokerageOptionValue,
    this.orderSourceId,
    this.paymentModeId,
    this.partyName,
    this.brokerName,
    this.paymentModeName,
    this.orderSourceName,
    this.brokerCommissionOptionName,
    this.rows = const [],
  });

  @override
  List<Object?> get props => [
        docNbr,
        docDate,
        refDocNbr,
        partyId,
        brokerId,
        currencyId,
        currencyRate,
        brokerageOptionId,
        brokerageOptionValue,
        orderSourceId,
        paymentModeId,
        partyName,
        brokerName,
        paymentModeName,
        orderSourceName,
        brokerCommissionOptionName,
        rows,
      ];
}

class PurchaseOrderDetailRowEntity extends Equatable {
  final String? itemName;
  final String? contractModeName;
  final double? qtyPack;
  final double? pricePack;
  final double? weightPriceUnit;
  final double? ttlDisc;
  final double? taxAmount;
  final double? subTotal;
  final double? rowTotal;

  const PurchaseOrderDetailRowEntity({
    this.itemName,
    this.contractModeName,
    this.qtyPack,
    this.pricePack,
    this.weightPriceUnit,
    this.ttlDisc,
    this.taxAmount,
    this.subTotal,
    this.rowTotal,
  });

  @override
  List<Object?> get props => [
        itemName,
        contractModeName,
        qtyPack,
        pricePack,
        weightPriceUnit,
        ttlDisc,
        taxAmount,
        subTotal,
        rowTotal,
      ];
}
