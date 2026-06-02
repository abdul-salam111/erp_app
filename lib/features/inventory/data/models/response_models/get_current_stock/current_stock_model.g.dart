// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_stock_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentStockModel _$CurrentStockModelFromJson(Map<String, dynamic> json) =>
    _CurrentStockModel(
      itemId: (json['ItemId'] as num?)?.toInt(),
      item: json['Item'] == null
          ? null
          : CurrentStockItem.fromJson(json['Item'] as Map<String, dynamic>),
      currentQty: (json['CurrentQty'] as num?)?.toDouble(),
      currentWeight: (json['CurrentWeight'] as num?)?.toDouble(),
      upcommingQty: (json['UpcommingQty'] as num?)?.toDouble(),
      upcommingWeight: (json['UpcommingWeight'] as num?)?.toDouble(),
      totalQty: (json['TotalQty'] as num?)?.toDouble(),
      totalWeight: (json['TotalWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrentStockModelToJson(_CurrentStockModel instance) =>
    <String, dynamic>{
      'ItemId': instance.itemId,
      'Item': instance.item,
      'CurrentQty': instance.currentQty,
      'CurrentWeight': instance.currentWeight,
      'UpcommingQty': instance.upcommingQty,
      'UpcommingWeight': instance.upcommingWeight,
      'TotalQty': instance.totalQty,
      'TotalWeight': instance.totalWeight,
    };

_CurrentStockItem _$CurrentStockItemFromJson(Map<String, dynamic> json) =>
    _CurrentStockItem(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      manufacturerId: (json['ManufacturerId'] as num?)?.toInt(),
      groupId: (json['GroupId'] as num?)?.toInt(),
      invAmountBasedOn: json['InvAmountBasedOn'] as String?,
    );

Map<String, dynamic> _$CurrentStockItemToJson(_CurrentStockItem instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'ManufacturerId': instance.manufacturerId,
      'GroupId': instance.groupId,
      'InvAmountBasedOn': instance.invAmountBasedOn,
    };
