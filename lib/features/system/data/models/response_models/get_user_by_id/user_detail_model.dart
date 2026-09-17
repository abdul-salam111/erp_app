import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_detail_model.freezed.dart';
part 'user_detail_model.g.dart';

@freezed
abstract class UserDetailModel with _$UserDetailModel {
  const factory UserDetailModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'MisUserId') int? misUserId,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'Designation') String? designation,
    @JsonKey(name: 'ActiveStatus') String? activeStatus,
    @JsonKey(name: 'FlgDashboardLandingPage') bool? flgDashboardLandingPage,
    @JsonKey(name: 'Archived') bool? archived,
    @JsonKey(name: 'PersonInfo') UserDetailPersonInfoModel? personInfo,
    @JsonKey(name: 'Language') UserDetailLanguageModel? language,
    @JsonKey(name: 'LandingPageFeature')
    UserDetailLandingPageFeatureModel? landingPageFeature,
    @JsonKey(name: 'LandingPageFeatureId') int? landingPageFeatureId,
    @JsonKey(name: 'Roles') List<UserDetailRoleModel>? roles,
  }) = _UserDetailModel;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);
}

@freezed
abstract class UserDetailPersonInfoModel with _$UserDetailPersonInfoModel {
  const factory UserDetailPersonInfoModel({
    @JsonKey(name: 'FirstName') String? firstName,
    @JsonKey(name: 'LastName') String? lastName,
    @JsonKey(name: 'FullName') String? fullName,
    @JsonKey(name: 'Gender') String? gender,
    @JsonKey(name: 'Contact') UserDetailContactModel? contact,
  }) = _UserDetailPersonInfoModel;

  factory UserDetailPersonInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailPersonInfoModelFromJson(json);
}

@freezed
abstract class UserDetailContactModel with _$UserDetailContactModel {
  const factory UserDetailContactModel({
    @JsonKey(name: 'Numbers') List<UserDetailContactNumberModel>? numbers,
  }) = _UserDetailContactModel;

  factory UserDetailContactModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailContactModelFromJson(json);
}

@freezed
abstract class UserDetailContactNumberModel
    with _$UserDetailContactNumberModel {
  const factory UserDetailContactNumberModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Type') String? type,
    @JsonKey(name: 'International') String? international,
    @JsonKey(name: 'E164') String? e164,
    @JsonKey(name: 'National') String? national,
    @JsonKey(name: 'RegionCode') String? regionCode,
    @JsonKey(name: 'CountryCode') String? countryCode,
    @JsonKey(name: 'FlgMobile') bool? flgMobile,
    @JsonKey(name: 'FlgWork') bool? flgWork,
    @JsonKey(name: 'FlgWhatsApp') bool? flgWhatsApp,
  }) = _UserDetailContactNumberModel;

  factory UserDetailContactNumberModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailContactNumberModelFromJson(json);
}

@freezed
abstract class UserDetailLanguageModel with _$UserDetailLanguageModel {
  const factory UserDetailLanguageModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SysKey') String? sysKey,
  }) = _UserDetailLanguageModel;

  factory UserDetailLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailLanguageModelFromJson(json);
}

@freezed
abstract class UserDetailLandingPageFeatureModel
    with _$UserDetailLandingPageFeatureModel {
  const factory UserDetailLandingPageFeatureModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'Name') String? name,
    @JsonKey(name: 'SysKey') String? sysKey,
  }) = _UserDetailLandingPageFeatureModel;

  factory UserDetailLandingPageFeatureModel.fromJson(
          Map<String, dynamic> json) =>
      _$UserDetailLandingPageFeatureModelFromJson(json);
}

@freezed
abstract class UserDetailRoleModel with _$UserDetailRoleModel {
  const factory UserDetailRoleModel({
    @JsonKey(name: 'Id') int? id,
    @JsonKey(name: 'RoleId') int? roleId,
    @JsonKey(name: 'RoleName') String? roleName,
    @JsonKey(name: 'RoleKey') String? roleKey,
    @JsonKey(name: 'BranchName') String? branchName,
    @JsonKey(name: 'MisBranchId') int? misBranchId,
  }) = _UserDetailRoleModel;

  factory UserDetailRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailRoleModelFromJson(json);
}
