import 'package:freezed_annotation/freezed_annotation.dart';

part 'partah_category_item.freezed.dart';
part 'partah_category_item.g.dart';

@freezed
abstract class PartahCategoryItem with _$PartahCategoryItem {
    const factory PartahCategoryItem({
        @JsonKey(name: "Log")
        Log? log,
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
    }) = _PartahCategoryItem;

    factory PartahCategoryItem.fromJson(Map<String, dynamic> json) =>
        _$PartahCategoryItemFromJson(json);
}

@freezed
abstract class Log with _$Log {
    const factory Log({
        @JsonKey(name: "CreatedOn")
        DateTime? createdOn,
        @JsonKey(name: "Creator")
        String? creator,
        @JsonKey(name: "ModifiedOn")
        DateTime? modifiedOn,
        @JsonKey(name: "Modifier")
        String? modifier,
    }) = _Log;

    factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
}
