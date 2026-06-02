import 'package:freezed_annotation/freezed_annotation.dart';
part 'stock_recieved_model.freezed.dart';
part 'stock_recieved_model.g.dart';

@freezed
abstract class StockRecievedModel with _$StockRecievedModel {
    const factory StockRecievedModel({
        @JsonKey(name: "PartyId")
        int? partyId,
        @JsonKey(name: "Party")
        Party? party,
        @JsonKey(name: "ItemId")
        int? itemId,
        @JsonKey(name: "Item")
        StockReceivedItem? item,
        @JsonKey(name: "ItemCount")
        int? itemCount,
        @JsonKey(name: "Qty")
        double? qty,
        @JsonKey(name: "Weight")
        double? weight,
    }) = _StockRecievedModel;

    factory StockRecievedModel.fromJson(Map<String, dynamic> json) => _$StockRecievedModelFromJson(json);
}

@freezed
abstract class Party with _$Party {
    const factory Party({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "FullName")
        String? fullName,
        @JsonKey(name: "PartyTypeId")
        int? partyTypeId,
        @JsonKey(name: "LocationId")
        int? locationId,
        @JsonKey(name: "LocationName")
        String? locationName,
        @JsonKey(name: "PartyTypeName")
        String? partyTypeName,
    }) = _Party;

    factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);
}

@freezed
abstract class StockReceivedItem with _$StockReceivedItem {
    const factory StockReceivedItem({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "ManufacturerId")
        int? manufacturerId,
        @JsonKey(name: "GroupId")
        int? groupId,
    }) = _StockReceivedItem;

    factory StockReceivedItem.fromJson(Map<String, dynamic> json) => _$StockReceivedItemFromJson(json);
}
