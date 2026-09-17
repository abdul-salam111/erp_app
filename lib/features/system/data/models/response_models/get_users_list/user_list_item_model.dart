import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_list_item_model.freezed.dart';
part 'user_list_item_model.g.dart';

@freezed
abstract class UserListItemModel with _$UserListItemModel {
  const factory UserListItemModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'MisUserId') int? misUserId,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Designation') String? designation,
    @JsonKey(name: 'ActiveStatus') String? activeStatus,
    @JsonKey(name: 'FlgDashboardLandingPage') bool? flgDashboardLandingPage,
    @JsonKey(name: 'Archived') bool? archived,
    @JsonKey(name: 'PersonInfo') UserPersonInfoModel? personInfo,
    @JsonKey(name: 'Language') UserLanguageModel? language,
    @JsonKey(name: 'LandingPageFeature')
    UserLandingPageFeatureModel? landingPageFeature,
    @JsonKey(name: 'Roles') List<UserRoleModel>? roles,
  }) = _UserListItemModel;

  factory UserListItemModel.fromJson(Map<String, dynamic> json) =>
      _$UserListItemModelFromJson(json);
}

@freezed
abstract class UserPersonInfoModel with _$UserPersonInfoModel {
  const factory UserPersonInfoModel({
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Gender') String? gender,
  }) = _UserPersonInfoModel;

  factory UserPersonInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserPersonInfoModelFromJson(json);
}

@freezed
abstract class UserLanguageModel with _$UserLanguageModel {
  const factory UserLanguageModel({
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SysKey') String? sysKey,
  }) = _UserLanguageModel;

  factory UserLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$UserLanguageModelFromJson(json);
}

@freezed
abstract class UserLandingPageFeatureModel with _$UserLandingPageFeatureModel {
  const factory UserLandingPageFeatureModel({
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'ShortName') String? shortName,
    @JsonKey(name: 'SysKey') String? sysKey,
  }) = _UserLandingPageFeatureModel;

  factory UserLandingPageFeatureModel.fromJson(Map<String, dynamic> json) =>
      _$UserLandingPageFeatureModelFromJson(json);
}

@freezed
abstract class UserRoleModel with _$UserRoleModel {
  const factory UserRoleModel({
    @JsonKey(name: 'RoleId') int? roleId,
    @JsonKey(name: 'RoleName') String? roleName,
    @JsonKey(name: 'RoleKey') String? roleKey,
    @JsonKey(name: 'BranchName') String? branchName,
  }) = _UserRoleModel;

  factory UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoleModelFromJson(json);
}
