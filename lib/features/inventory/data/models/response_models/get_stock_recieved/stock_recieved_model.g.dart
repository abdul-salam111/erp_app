// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_recieved_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StockRecievedModel _$StockRecievedModelFromJson(Map<String, dynamic> json) =>
    _StockRecievedModel(
      partyId: (json['PartyId'] as num?)?.toInt(),
      party: json['Party'] == null
          ? null
          : Party.fromJson(json['Party'] as Map<String, dynamic>),
      itemId: (json['ItemId'] as num?)?.toInt(),
      itemCount: (json['ItemCount'] as num?)?.toInt(),
      qty: (json['Qty'] as num?)?.toInt(),
      weight: (json['Weight'] as num?)?.toInt(),
      item: json['Item'] == null
          ? null
          : Item.fromJson(json['Item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StockRecievedModelToJson(_StockRecievedModel instance) =>
    <String, dynamic>{
      'PartyId': instance.partyId,
      'Party': instance.party,
      'ItemId': instance.itemId,
      'ItemCount': instance.itemCount,
      'Qty': instance.qty,
      'Weight': instance.weight,
      'Item': instance.item,
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
      : ItemGroup.fromJson(json['Group'] as Map<String, dynamic>),
  manufacturer: json['Manufacturer'] == null
      ? null
      : Manufacturer.fromJson(json['Manufacturer'] as Map<String, dynamic>),
  manufacturerId: (json['ManufacturerId'] as num?)?.toInt(),
  archived: json['Archived'] as bool?,
  flgHasLots: json['FlgHasLots'] as bool?,
  flgFridgeItem: json['FlgFridgeItem'] as bool?,
  flgNorcorticItem: json['FlgNorcorticItem'] as bool?,
  flgWht: json['FlgWHT'] as bool?,
  id: (json['Id'] as num?)?.toInt(),
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
  'FlgHasLots': instance.flgHasLots,
  'FlgFridgeItem': instance.flgFridgeItem,
  'FlgNorcorticItem': instance.flgNorcorticItem,
  'FlgWHT': instance.flgWht,
  'Id': instance.id,
};

_ItemGroup _$ItemGroupFromJson(Map<String, dynamic> json) => _ItemGroup(
  name: json['Name'] as String?,
  typeId: (json['TypeId'] as num?)?.toInt(),
  type: json['Type'] == null
      ? null
      : Type.fromJson(json['Type'] as Map<String, dynamic>),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ItemGroupToJson(_ItemGroup instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'TypeId': instance.typeId,
      'Type': instance.type,
      'Id': instance.id,
    };

_Type _$TypeFromJson(Map<String, dynamic> json) => _Type(
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  id: (json['Id'] as num?)?.toInt(),
  breadcrumb: json['Breadcrumb'] as String?,
);

Map<String, dynamic> _$TypeToJson(_Type instance) => <String, dynamic>{
  'Name': instance.name,
  'SysKey': instance.sysKey,
  'Id': instance.id,
  'Breadcrumb': instance.breadcrumb,
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

_Unit _$UnitFromJson(Map<String, dynamic> json) => _Unit(
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  multiplier: (json['Multiplier'] as num?)?.toInt(),
  decimals: (json['Decimals'] as num?)?.toInt(),
  groupId: (json['GroupId'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$UnitToJson(_Unit instance) => <String, dynamic>{
  'Name': instance.name,
  'SysKey': instance.sysKey,
  'Multiplier': instance.multiplier,
  'Decimals': instance.decimals,
  'GroupId': instance.groupId,
  'Id': instance.id,
};

_Party _$PartyFromJson(Map<String, dynamic> json) => _Party(
  flgBusiness: json['FlgBusiness'] as bool?,
  fullName: json['FullName'] as String?,
  contactId: (json['ContactId'] as num?)?.toInt(),
  contact: json['Contact'] == null
      ? null
      : Contact.fromJson(json['Contact'] as Map<String, dynamic>),
  currencyId: (json['CurrencyId'] as num?)?.toInt(),
  currency: json['Currency'] == null
      ? null
      : Currency.fromJson(json['Currency'] as Map<String, dynamic>),
  locationId: (json['LocationId'] as num?)?.toInt(),
  location: json['Location'] == null
      ? null
      : Location.fromJson(json['Location'] as Map<String, dynamic>),
  accountId: (json['AccountId'] as num?)?.toInt(),
  account: json['Account'] == null
      ? null
      : Account.fromJson(json['Account'] as Map<String, dynamic>),
  typeId: (json['TypeId'] as num?)?.toInt(),
  partyType: json['PartyType'] == null
      ? null
      : PartyType.fromJson(json['PartyType'] as Map<String, dynamic>),
  flgOtpVerified: json['FlgOTPVerified'] as bool?,
  flgFiler: json['FlgFiler'] as bool?,
  creditDays: (json['CreditDays'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
  gradingId: (json['GradingId'] as num?)?.toInt(),
  categoryId: (json['CategoryId'] as num?)?.toInt(),
  grading: json['Grading'] == null
      ? null
      : Grading.fromJson(json['Grading'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PartyToJson(_Party instance) => <String, dynamic>{
  'FlgBusiness': instance.flgBusiness,
  'FullName': instance.fullName,
  'ContactId': instance.contactId,
  'Contact': instance.contact,
  'CurrencyId': instance.currencyId,
  'Currency': instance.currency,
  'LocationId': instance.locationId,
  'Location': instance.location,
  'AccountId': instance.accountId,
  'Account': instance.account,
  'TypeId': instance.typeId,
  'PartyType': instance.partyType,
  'FlgOTPVerified': instance.flgOtpVerified,
  'FlgFiler': instance.flgFiler,
  'CreditDays': instance.creditDays,
  'Id': instance.id,
  'GradingId': instance.gradingId,
  'CategoryId': instance.categoryId,
  'Grading': instance.grading,
};

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
  name: json['Name'] as String?,
  accTypeId: (json['AccTypeId'] as num?)?.toInt(),
  groupId: (json['GroupId'] as num?)?.toInt(),
  currencyId: (json['CurrencyId'] as num?)?.toInt(),
  accType: json['AccType'] == null
      ? null
      : AccType.fromJson(json['AccType'] as Map<String, dynamic>),
  group: json['Group'] == null
      ? null
      : AccountGroup.fromJson(json['Group'] as Map<String, dynamic>),
  flgControlledAcc: json['FlgControlledAcc'] as bool?,
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
  'Name': instance.name,
  'AccTypeId': instance.accTypeId,
  'GroupId': instance.groupId,
  'CurrencyId': instance.currencyId,
  'AccType': instance.accType,
  'Group': instance.group,
  'FlgControlledAcc': instance.flgControlledAcc,
  'Id': instance.id,
};

_AccType _$AccTypeFromJson(Map<String, dynamic> json) => _AccType(
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  breadcrumb: json['Breadcrumb'] as String?,
  parentId: (json['ParentId'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$AccTypeToJson(_AccType instance) => <String, dynamic>{
  'Name': instance.name,
  'SysKey': instance.sysKey,
  'Breadcrumb': instance.breadcrumb,
  'ParentId': instance.parentId,
  'Id': instance.id,
};

_AccountGroup _$AccountGroupFromJson(Map<String, dynamic> json) =>
    _AccountGroup(
      name: json['Name'] as String?,
      breadcrumb: json['Breadcrumb'] as String?,
      groupTypeId: (json['GroupTypeId'] as num?)?.toInt(),
      depth: (json['Depth'] as num?)?.toInt(),
      parentId: (json['ParentId'] as num?)?.toInt(),
      sortingId: json['SortingId'] as String?,
      groupType: json['GroupType'] == null
          ? null
          : Type.fromJson(json['GroupType'] as Map<String, dynamic>),
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AccountGroupToJson(_AccountGroup instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Breadcrumb': instance.breadcrumb,
      'GroupTypeId': instance.groupTypeId,
      'Depth': instance.depth,
      'ParentId': instance.parentId,
      'SortingId': instance.sortingId,
      'GroupType': instance.groupType,
      'Id': instance.id,
    };

_Contact _$ContactFromJson(Map<String, dynamic> json) => _Contact(
  numbers: json['Numbers'] as List<dynamic>?,
  flgBusiness: json['FlgBusiness'] as bool?,
  email1: json['Email1'] as String?,
  contactNumbers: json['ContactNumbers'] as String?,
  archived: json['Archived'] as bool?,
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ContactToJson(_Contact instance) => <String, dynamic>{
  'Numbers': instance.numbers,
  'FlgBusiness': instance.flgBusiness,
  'Email1': instance.email1,
  'ContactNumbers': instance.contactNumbers,
  'Archived': instance.archived,
  'Id': instance.id,
};

_Currency _$CurrencyFromJson(Map<String, dynamic> json) => _Currency(
  code: json['Code'] as String?,
  symbol: json['Symbol'] as String?,
  decimals: (json['Decimals'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CurrencyToJson(_Currency instance) => <String, dynamic>{
  'Code': instance.code,
  'Symbol': instance.symbol,
  'Decimals': instance.decimals,
  'Id': instance.id,
};

_Grading _$GradingFromJson(Map<String, dynamic> json) => _Grading(
  name: json['Name'] as String?,
  shortName: json['ShortName'] as String?,
  sysKey: json['SysKey'] as String?,
  displayOrder: (json['DisplayOrder'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$GradingToJson(_Grading instance) => <String, dynamic>{
  'Name': instance.name,
  'ShortName': instance.shortName,
  'SysKey': instance.sysKey,
  'DisplayOrder': instance.displayOrder,
  'Id': instance.id,
};

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  name: json['Name'] as String?,
  countryId: (json['CountryId'] as num?)?.toInt(),
  breadcrumb: json['Breadcrumb'] as String?,
  cityId: (json['CityId'] as num?)?.toInt(),
  city: json['City'] as String?,
  typeId: (json['TypeId'] as num?)?.toInt(),
  type: json['Type'] == null
      ? null
      : Type.fromJson(json['Type'] as Map<String, dynamic>),
  level: (json['Level'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'Name': instance.name,
  'CountryId': instance.countryId,
  'Breadcrumb': instance.breadcrumb,
  'CityId': instance.cityId,
  'City': instance.city,
  'TypeId': instance.typeId,
  'Type': instance.type,
  'Level': instance.level,
  'Id': instance.id,
};

_PartyType _$PartyTypeFromJson(Map<String, dynamic> json) => _PartyType(
  l1TypeName: json['L1TypeName'] as String?,
  l1TypeKey: json['L1TypeKey'] as String?,
  l2TypeName: json['L2TypeName'] as String?,
  l2TypeKey: json['L2TypeKey'] as String?,
  flgSystem: json['FlgSystem'] as bool?,
  archived: json['Archived'] as bool?,
  id: (json['Id'] as num?)?.toInt(),
  whTaxFilerPercentage: (json['WHTaxFilerPercentage'] as num?)?.toInt(),
  whTaxNonFilerPercentage: (json['WHTaxNonFilerPercentage'] as num?)?.toInt(),
);

Map<String, dynamic> _$PartyTypeToJson(_PartyType instance) =>
    <String, dynamic>{
      'L1TypeName': instance.l1TypeName,
      'L1TypeKey': instance.l1TypeKey,
      'L2TypeName': instance.l2TypeName,
      'L2TypeKey': instance.l2TypeKey,
      'FlgSystem': instance.flgSystem,
      'Archived': instance.archived,
      'Id': instance.id,
      'WHTaxFilerPercentage': instance.whTaxFilerPercentage,
      'WHTaxNonFilerPercentage': instance.whTaxNonFilerPercentage,
    };
