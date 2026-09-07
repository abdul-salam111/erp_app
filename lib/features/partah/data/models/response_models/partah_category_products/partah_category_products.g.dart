// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partah_category_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartahCategoryProducts _$PartahCategoryProductsFromJson(
  Map<String, dynamic> json,
) => _PartahCategoryProducts(
  itemId: (json['ItemId'] as num?)?.toInt(),
  itemName: json['ItemName'] as String?,
  itemGroupName: json['ItemGroupName'] as String?,
);

Map<String, dynamic> _$PartahCategoryProductsToJson(
  _PartahCategoryProducts instance,
) => <String, dynamic>{
  'ItemId': instance.itemId,
  'ItemName': instance.itemName,
  'ItemGroupName': instance.itemGroupName,
};
