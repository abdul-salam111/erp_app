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
          : Item.fromJson(json['Item'] as Map<String, dynamic>),
      currentQty: (json['CurrentQty'] as num?)?.toDouble(),
      currentWeight: (json['CurrentWeight'] as num?)?.toDouble(),
      upcommingQty: (json['UpcommingQty'] as num?)?.toInt(),
      upcommingWeight: (json['UpcommingWeight'] as num?)?.toInt(),
      totalQty: (json['TotalQty'] as num?)?.toDouble(),
      totalWeight: (json['TotalWeight'] as num?)?.toDouble(),
      cost: (json['Cost'] as num?)?.toInt(),
      ttlValue: (json['TTLValue'] as num?)?.toInt(),
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
      'Cost': instance.cost,
      'TTLValue': instance.ttlValue,
    };

_Item _$ItemFromJson(Map<String, dynamic> json) => _Item(
  name: json['Name'] as String?,
  stockUnitId: (json['StockUnitId'] as num?)?.toInt(),
  stockUnit: json['StockUnit'] == null
      ? null
      : Unit.fromJson(json['StockUnit'] as Map<String, dynamic>),
  primaryUnitId: (json['PrimaryUnitId'] as num?)?.toInt(),
  primaryUnit: json['PrimaryUnit'] == null
      ? null
      : Unit.fromJson(json['PrimaryUnit'] as Map<String, dynamic>),
  costingMethod: json['CostingMethod'] as String?,
  invAmountBasedOn: json['InvAmountBasedOn'] as String?,
  groupId: (json['GroupId'] as num?)?.toInt(),
  group: json['Group'] == null
      ? null
      : Group.fromJson(json['Group'] as Map<String, dynamic>),
  manufacturer: json['Manufacturer'] == null
      ? null
      : Manufacturer.fromJson(json['Manufacturer'] as Map<String, dynamic>),
  manufacturerId: (json['ManufacturerId'] as num?)?.toInt(),
  archived: json['Archived'] as bool?,
  flgFridgeItem: json['FlgFridgeItem'] as bool?,
  flgNorcorticItem: json['FlgNorcorticItem'] as bool?,
  flgWht: json['FlgWHT'] as bool?,
  id: (json['Id'] as num?)?.toInt(),
  flgHasLots: json['FlgHasLots'] as bool?,
);

Map<String, dynamic> _$ItemToJson(_Item instance) => <String, dynamic>{
  'Name': instance.name,
  'StockUnitId': instance.stockUnitId,
  'StockUnit': instance.stockUnit,
  'PrimaryUnitId': instance.primaryUnitId,
  'PrimaryUnit': instance.primaryUnit,
  'CostingMethod': instance.costingMethod,
  'InvAmountBasedOn': instance.invAmountBasedOn,
  'GroupId': instance.groupId,
  'Group': instance.group,
  'Manufacturer': instance.manufacturer,
  'ManufacturerId': instance.manufacturerId,
  'Archived': instance.archived,
  'FlgFridgeItem': instance.flgFridgeItem,
  'FlgNorcorticItem': instance.flgNorcorticItem,
  'FlgWHT': instance.flgWht,
  'Id': instance.id,
  'FlgHasLots': instance.flgHasLots,
};

_Group _$GroupFromJson(Map<String, dynamic> json) => _Group(
  name: json['Name'] as String?,
  typeId: (json['TypeId'] as num?)?.toInt(),
  type: json['Type'] == null
      ? null
      : Type.fromJson(json['Type'] as Map<String, dynamic>),
  id: (json['Id'] as num?)?.toInt(),
  manufacturerId: (json['ManufacturerId'] as num?)?.toInt(),
  company: json['Company'] == null
      ? null
      : Manufacturer.fromJson(json['Company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GroupToJson(_Group instance) => <String, dynamic>{
  'Name': instance.name,
  'TypeId': instance.typeId,
  'Type': instance.type,
  'Id': instance.id,
  'ManufacturerId': instance.manufacturerId,
  'Company': instance.company,
};

_Manufacturer _$ManufacturerFromJson(Map<String, dynamic> json) =>
    _Manufacturer(
      name: json['Name'] as String?,
      archived: json['Archived'] as bool?,
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ManufacturerToJson(_Manufacturer instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Archived': instance.archived,
      'Id': instance.id,
    };

_Type _$TypeFromJson(Map<String, dynamic> json) => _Type(
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$TypeToJson(_Type instance) => <String, dynamic>{
  'Name': instance.name,
  'SysKey': instance.sysKey,
  'Id': instance.id,
};

_Unit _$UnitFromJson(Map<String, dynamic> json) => _Unit(
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  multiplier: (json['Multiplier'] as num?)?.toInt(),
  decimals: (json['Decimals'] as num?)?.toInt(),
  groupId: (json['GroupId'] as num?)?.toInt(),
  fbrOrganizationCode: (json['FBROrganizationCode'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$UnitToJson(_Unit instance) => <String, dynamic>{
  'Name': instance.name,
  'SysKey': instance.sysKey,
  'Multiplier': instance.multiplier,
  'Decimals': instance.decimals,
  'GroupId': instance.groupId,
  'FBROrganizationCode': instance.fbrOrganizationCode,
  'Id': instance.id,
};
