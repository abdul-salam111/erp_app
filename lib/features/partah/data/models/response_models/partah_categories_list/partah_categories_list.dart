import 'package:freezed_annotation/freezed_annotation.dart';

part 'partah_categories_list.freezed.dart';
part 'partah_categories_list.g.dart';

@freezed
abstract class PartahCategoriesList with _$PartahCategoriesList {
    const factory PartahCategoriesList({
        @JsonKey(name: "Categories")
        List<Category>? categories,
        @JsonKey(name: "UnassignedItemCount")
        int? unassignedItemCount,
    }) = _PartahCategoriesList;

    factory PartahCategoriesList.fromJson(Map<String, dynamic> json) =>
        _$PartahCategoriesListFromJson(json);
}

@freezed
abstract class Category with _$Category {
    const factory Category({
        @JsonKey(name: "CategoryKey")
        String? categoryKey,
        @JsonKey(name: "DisplayName")
        String? displayName,
        @JsonKey(name: "StandardBagKg")
        int? standardBagKg,
        @JsonKey(name: "SortOrder")
        int? sortOrder,
        @JsonKey(name: "IsActive")
        bool? isActive,
        @JsonKey(name: "IsRawMaterial")
        bool? isRawMaterial,
        @JsonKey(name: "ItemCount")
        int? itemCount,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "CreatorId")
        int? creatorId,
        @JsonKey(name: "CreatedOn")
        DateTime? createdOn,
        @JsonKey(name: "ModifierId")
        int? modifierId,
        @JsonKey(name: "ModifiedOn")
        DateTime? modifiedOn,
        @JsonKey(name: "Id")
        int? id,
    }) = _Category;

    factory Category.fromJson(Map<String, dynamic> json) =>
        _$CategoryFromJson(json);
}
