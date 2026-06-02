import 'package:freezed_annotation/freezed_annotation.dart';
part 'current_stock_model.freezed.dart';
part 'current_stock_model.g.dart';

@freezed
abstract class CurrentStockModel with _$CurrentStockModel {
    const factory CurrentStockModel({
        @JsonKey(name: "ItemId")
        int? itemId,
        @JsonKey(name: "Item")
        CurrentStockItem? item,
        @JsonKey(name: "CurrentQty")
        double? currentQty,
        @JsonKey(name: "CurrentWeight")
        double? currentWeight,
        @JsonKey(name: "UpcommingQty")
        double? upcommingQty,
        @JsonKey(name: "UpcommingWeight")
        double? upcommingWeight,
        @JsonKey(name: "TotalQty")
        double? totalQty,
        @JsonKey(name: "TotalWeight")
        double? totalWeight,
    }) = _CurrentStockModel;

    factory CurrentStockModel.fromJson(Map<String, dynamic> json) => _$CurrentStockModelFromJson(json);
}

@freezed
abstract class CurrentStockItem with _$CurrentStockItem {
    const factory CurrentStockItem({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "ManufacturerId")
        int? manufacturerId,
        @JsonKey(name: "GroupId")
        int? groupId,
        @JsonKey(name: "InvAmountBasedOn")
        String? invAmountBasedOn,
    }) = _CurrentStockItem;

    factory CurrentStockItem.fromJson(Map<String, dynamic> json) => _$CurrentStockItemFromJson(json);
}
