import 'package:freezed_annotation/freezed_annotation.dart';
part 'sale_order_summary_by_party.freezed.dart';
part 'sale_order_summary_by_party.g.dart';

@freezed
abstract class SaleOrderSummaryByParty with _$SaleOrderSummaryByParty {
    const factory SaleOrderSummaryByParty({
        @JsonKey(name: "Summary")
        Summary? summary,
        @JsonKey(name: "CustomerOrders")
        List<CustomerOrder>? customerOrders,
    }) = _SaleOrderSummaryByParty;

    factory SaleOrderSummaryByParty.fromJson(Map<String, dynamic> json) => _$SaleOrderSummaryByPartyFromJson(json);
}

@freezed
abstract class CustomerOrder with _$CustomerOrder {
    const factory CustomerOrder({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "Party")
        Party? party,
        @JsonKey(name: "DocNbr")
        String? docNbr,
        @JsonKey(name: "DocDate")
        DateTime? docDate,
        @JsonKey(name: "TTLQty")
        int? ttlQty,
        @JsonKey(name: "Item")
        Item? item,
        @JsonKey(name: "TTLRemainingQty")
        int? ttlRemainingQty,
        @JsonKey(name: "ContractMode")
        String? contractMode,
        @JsonKey(name: "Status")
        String? status,
        @JsonKey(name: "OrderWeightProgressPercentage")
        int? orderWeightProgressPercentage,
        @JsonKey(name: "OrderQtyProgressPercentage")
        int? orderQtyProgressPercentage,
        @JsonKey(name: "OrderProgressPercentage")
        int? orderProgressPercentage,
        @JsonKey(name: "OrderQtyRemainingPercentage")
        int? orderQtyRemainingPercentage,
        @JsonKey(name: "OrderWeightRemainingPercentage")
        int? orderWeightRemainingPercentage,
        @JsonKey(name: "OrderRemainingPercentage")
        int? orderRemainingPercentage,
        @JsonKey(name: "OrderQtyPercentage")
        int? orderQtyPercentage,
        @JsonKey(name: "OrderWeightPercentage")
        int? orderWeightPercentage,
    }) = _CustomerOrder;

    factory CustomerOrder.fromJson(Map<String, dynamic> json) => _$CustomerOrderFromJson(json);
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
        ItemGroup? group,
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
abstract class ItemGroup with _$ItemGroup {
    const factory ItemGroup({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "TypeId")
        int? typeId,
        @JsonKey(name: "Type")
        Type? type,
        @JsonKey(name: "Id")
        int? id,
    }) = _ItemGroup;

    factory ItemGroup.fromJson(Map<String, dynamic> json) => _$ItemGroupFromJson(json);
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
        @JsonKey(name: "Breadcrumb")
        String? breadcrumb,
    }) = _Type;

    factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
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

@freezed
abstract class Party with _$Party {
    const factory Party({
        @JsonKey(name: "FlgBusiness")
        bool? flgBusiness,
        @JsonKey(name: "FullName")
        String? fullName,
        @JsonKey(name: "ContactId")
        int? contactId,
        @JsonKey(name: "Contact")
        Contact? contact,
        @JsonKey(name: "CurrencyId")
        int? currencyId,
        @JsonKey(name: "Currency")
        Currency? currency,
        @JsonKey(name: "LocationId")
        int? locationId,
        @JsonKey(name: "Location")
        Location? location,
        @JsonKey(name: "AccountId")
        int? accountId,
        @JsonKey(name: "Account")
        Account? account,
        @JsonKey(name: "GradingId")
        int? gradingId,
        @JsonKey(name: "CategoryId")
        int? categoryId,
        @JsonKey(name: "Grading")
        Grading? grading,
        @JsonKey(name: "TypeId")
        int? typeId,
        @JsonKey(name: "PartyType")
        PartyType? partyType,
        @JsonKey(name: "FlgOTPVerified")
        bool? flgOtpVerified,
        @JsonKey(name: "FlgFiler")
        bool? flgFiler,
        @JsonKey(name: "CreditDays")
        int? creditDays,
        @JsonKey(name: "Id")
        int? id,
    }) = _Party;

    factory Party.fromJson(Map<String, dynamic> json) => _$PartyFromJson(json);
}

@freezed
abstract class Account with _$Account {
    const factory Account({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "AccTypeId")
        int? accTypeId,
        @JsonKey(name: "GroupId")
        int? groupId,
        @JsonKey(name: "CurrencyId")
        int? currencyId,
        @JsonKey(name: "AccType")
        AccType? accType,
        @JsonKey(name: "Group")
        AccountGroup? group,
        @JsonKey(name: "FlgControlledAcc")
        bool? flgControlledAcc,
        @JsonKey(name: "Id")
        int? id,
    }) = _Account;

    factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
}

@freezed
abstract class AccType with _$AccType {
    const factory AccType({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "SysKey")
        String? sysKey,
        @JsonKey(name: "Breadcrumb")
        String? breadcrumb,
        @JsonKey(name: "ParentId")
        int? parentId,
        @JsonKey(name: "Id")
        int? id,
    }) = _AccType;

    factory AccType.fromJson(Map<String, dynamic> json) => _$AccTypeFromJson(json);
}

@freezed
abstract class AccountGroup with _$AccountGroup {
    const factory AccountGroup({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "Breadcrumb")
        String? breadcrumb,
        @JsonKey(name: "GroupTypeId")
        int? groupTypeId,
        @JsonKey(name: "Depth")
        int? depth,
        @JsonKey(name: "ParentId")
        int? parentId,
        @JsonKey(name: "SortingId")
        String? sortingId,
        @JsonKey(name: "GroupType")
        Type? groupType,
        @JsonKey(name: "Id")
        int? id,
    }) = _AccountGroup;

    factory AccountGroup.fromJson(Map<String, dynamic> json) => _$AccountGroupFromJson(json);
}

@freezed
abstract class Contact with _$Contact {
    const factory Contact({
        @JsonKey(name: "Numbers")
        List<dynamic>? numbers,
        @JsonKey(name: "FlgBusiness")
        bool? flgBusiness,
        @JsonKey(name: "Email1")
        String? email1,
        @JsonKey(name: "ContactNumbers")
        String? contactNumbers,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "Id")
        int? id,
    }) = _Contact;

    factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
}

@freezed
abstract class Currency with _$Currency {
    const factory Currency({
        @JsonKey(name: "Code")
        String? code,
        @JsonKey(name: "Symbol")
        String? symbol,
        @JsonKey(name: "Decimals")
        int? decimals,
        @JsonKey(name: "Id")
        int? id,
    }) = _Currency;

    factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
}

@freezed
abstract class Grading with _$Grading {
    const factory Grading({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "ShortName")
        String? shortName,
        @JsonKey(name: "SysKey")
        String? sysKey,
        @JsonKey(name: "DisplayOrder")
        int? displayOrder,
        @JsonKey(name: "Id")
        int? id,
    }) = _Grading;

    factory Grading.fromJson(Map<String, dynamic> json) => _$GradingFromJson(json);
}

@freezed
abstract class Location with _$Location {
    const factory Location({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "CountryId")
        int? countryId,
        @JsonKey(name: "Breadcrumb")
        String? breadcrumb,
        @JsonKey(name: "CityId")
        int? cityId,
        @JsonKey(name: "City")
        String? city,
        @JsonKey(name: "TypeId")
        int? typeId,
        @JsonKey(name: "Type")
        Type? type,
        @JsonKey(name: "Level")
        int? level,
        @JsonKey(name: "Id")
        int? id,
    }) = _Location;

    factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
}

@freezed
abstract class PartyType with _$PartyType {
    const factory PartyType({
        @JsonKey(name: "L1TypeName")
        String? l1TypeName,
        @JsonKey(name: "L1TypeKey")
        String? l1TypeKey,
        @JsonKey(name: "L2TypeName")
        String? l2TypeName,
        @JsonKey(name: "L2TypeKey")
        String? l2TypeKey,
        @JsonKey(name: "FlgSystem")
        bool? flgSystem,
        @JsonKey(name: "WHTaxFilerPercentage")
        int? whTaxFilerPercentage,
        @JsonKey(name: "WHTaxNonFilerPercentage")
        int? whTaxNonFilerPercentage,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "Id")
        int? id,
    }) = _PartyType;

    factory PartyType.fromJson(Map<String, dynamic> json) => _$PartyTypeFromJson(json);
}

@freezed
abstract class Summary with _$Summary {
    const factory Summary({
        @JsonKey(name: "TTLOrders")
        int? ttlOrders,
        @JsonKey(name: "TTLCompletedOrders")
        int? ttlCompletedOrders,
        @JsonKey(name: "TTLPartialOrders")
        int? ttlPartialOrders,
        @JsonKey(name: "TTLNotStartedOrders")
        int? ttlNotStartedOrders,
    }) = _Summary;

    factory Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);
}
