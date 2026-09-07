import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_partah_category.freezed.dart';
part 'created_partah_category.g.dart';

@freezed
abstract class CreatedPartahCategory with _$CreatedPartahCategory {
    const factory CreatedPartahCategory({
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
        @JsonKey(name: "Id")
        int? id,
    }) = _CreatedPartahCategory;

    factory CreatedPartahCategory.fromJson(Map<String, dynamic> json) =>
        _$CreatedPartahCategoryFromJson(json);
}

@freezed
abstract class Log with _$Log {
    const factory Log({
        @JsonKey(name: "CreatedOn")
        DateTime? createdOn,
        @JsonKey(name: "Creator")
        String? creator,
    }) = _Log;

    factory Log.fromJson(Map<String, dynamic> json) => _$LogFromJson(json);
}
