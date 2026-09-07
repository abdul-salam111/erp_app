import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_partah_category.freezed.dart';
part 'create_partah_category.g.dart';

@freezed
abstract class CreatePartahCategory with _$CreatePartahCategory {
    const factory CreatePartahCategory({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "CategoryKey")
        String? categoryKey,
        @JsonKey(name: "DisplayName")
        String? displayName,
        @JsonKey(name: "IsActive")
        bool? isActive,
        @JsonKey(name: "IsRawMaterial")
        bool? isRawMaterial,
        @JsonKey(name: "SortOrder")
        int? sortOrder,
        @JsonKey(name: "StandardBagKg")
        int? standardBagKg,
    }) = _CreatePartahCategory;

    factory CreatePartahCategory.fromJson(Map<String, dynamic> json) =>
        _$CreatePartahCategoryFromJson(json);
}
