import 'package:freezed_annotation/freezed_annotation.dart';

part 'partah_category_products.freezed.dart';
part 'partah_category_products.g.dart';

@freezed
abstract class PartahCategoryProducts with _$PartahCategoryProducts {
    const factory PartahCategoryProducts({
        @JsonKey(name: "ItemId")
        int? itemId,
        @JsonKey(name: "ItemName")
        String? itemName,
        @JsonKey(name: "ItemGroupName")
        String? itemGroupName,
    }) = _PartahCategoryProducts;

    factory PartahCategoryProducts.fromJson(Map<String, dynamic> json) =>
        _$PartahCategoryProductsFromJson(json);
}
