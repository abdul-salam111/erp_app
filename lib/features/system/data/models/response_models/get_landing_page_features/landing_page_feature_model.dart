import 'package:freezed_annotation/freezed_annotation.dart';

part 'landing_page_feature_model.freezed.dart';
part 'landing_page_feature_model.g.dart';

@freezed
abstract class LandingPageFeatureModel with _$LandingPageFeatureModel {
  const factory LandingPageFeatureModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SysKey') String? sysKey,
    @JsonKey(name: 'ModuleId') int? moduleId,
    @JsonKey(name: 'Module') LandingPageModuleModel? module,
  }) = _LandingPageFeatureModel;

  factory LandingPageFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$LandingPageFeatureModelFromJson(json);
}

@freezed
abstract class LandingPageModuleModel with _$LandingPageModuleModel {
  const factory LandingPageModuleModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SysKey') String? sysKey,
  }) = _LandingPageModuleModel;

  factory LandingPageModuleModel.fromJson(Map<String, dynamic> json) =>
      _$LandingPageModuleModelFromJson(json);
}
