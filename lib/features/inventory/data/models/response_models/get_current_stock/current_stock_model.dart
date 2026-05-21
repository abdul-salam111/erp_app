import 'package:freezed_annotation/freezed_annotation.dart';
part 'current_stock_model.freezed.dart';
part 'current_stock_model.g.dart';

@freezed
abstract class CurrentStockModel with _$CurrentStockModel {
    const factory CurrentStockModel({
        @JsonKey(name: "ItemId")
        int? itemId,
        @JsonKey(name: "Item")
        Item? item,
        @JsonKey(name: "CurrentQty")
        double? currentQty,
        @JsonKey(name: "CurrentWeight")
        double? currentWeight,
        @JsonKey(name: "UpcommingQty")
        int? upcommingQty,
        @JsonKey(name: "UpcommingWeight")
        int? upcommingWeight,
        @JsonKey(name: "TotalQty")
        double? totalQty,
        @JsonKey(name: "TotalWeight")
        double? totalWeight,
        @JsonKey(name: "Cost")
        int? cost,
        @JsonKey(name: "TTLValue")
        int? ttlValue,
    }) = _CurrentStockModel;

    factory CurrentStockModel.fromJson(Map<String, dynamic> json) => _$CurrentStockModelFromJson(json);
}

@freezed
abstract class Item with _$Item {
    const factory Item({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "StockUnitId")
        int? stockUnitId,
        @JsonKey(name: "StockUnit")
        Unit? stockUnit,
        @JsonKey(name: "PrimaryUnitId")
        int? primaryUnitId,
        @JsonKey(name: "PrimaryUnit")
        Unit? primaryUnit,
        @JsonKey(name: "CostingMethod")
        String? costingMethod,
        @JsonKey(name: "InvAmountBasedOn")
        String? invAmountBasedOn,
        @JsonKey(name: "GroupId")
        int? groupId,
        @JsonKey(name: "Group")
        Group? group,
        @JsonKey(name: "Manufacturer")
        Manufacturer? manufacturer,
        @JsonKey(name: "ManufacturerId")
        int? manufacturerId,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "FlgFridgeItem")
        bool? flgFridgeItem,
        @JsonKey(name: "FlgNorcorticItem")
        bool? flgNorcorticItem,
        @JsonKey(name: "FlgWHT")
        bool? flgWht,
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "FlgHasLots")
        bool? flgHasLots,
    }) = _Item;

    factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
abstract class Group with _$Group {
    const factory Group({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "TypeId")
        int? typeId,
        @JsonKey(name: "Type")
        Type? type,
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "ManufacturerId")
        int? manufacturerId,
        @JsonKey(name: "Company")
        Manufacturer? company,
    }) = _Group;

    factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@freezed
abstract class Manufacturer with _$Manufacturer {
    const factory Manufacturer({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "Id")
        int? id,
    }) = _Manufacturer;

    factory Manufacturer.fromJson(Map<String, dynamic> json) => _$ManufacturerFromJson(json);
}

@freezed
abstract class Type with _$Type {
    const factory Type({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "SysKey")
        String? sysKey,
        @JsonKey(name: "Id")
        int? id,
    }) = _Type;

    factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}

@freezed
abstract class Unit with _$Unit {
    const factory Unit({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "SysKey")
        String? sysKey,
        @JsonKey(name: "Multiplier")
        int? multiplier,
        @JsonKey(name: "Decimals")
        int? decimals,
        @JsonKey(name: "GroupId")
        int? groupId,
        @JsonKey(name: "FBROrganizationCode")
        int? fbrOrganizationCode,
        @JsonKey(name: "Id")
        int? id,
    }) = _Unit;

    factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
