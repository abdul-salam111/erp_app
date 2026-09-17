// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserListItemModel _$UserListItemModelFromJson(Map<String, dynamic> json) =>
    _UserListItemModel(
      id: (json['Id'] as num?)?.toInt(),
      misUserId: (json['MisUserId'] as num?)?.toInt(),
      name: json['Name'] as String?,
      email: json['Email'] as String?,
      designation: json['Designation'] as String?,
      activeStatus: json['ActiveStatus'] as String?,
      flgDashboardLandingPage: json['FlgDashboardLandingPage'] as bool?,
      archived: json['Archived'] as bool?,
      personInfo: json['PersonInfo'] == null
          ? null
          : UserPersonInfoModel.fromJson(
              json['PersonInfo'] as Map<String, dynamic>,
            ),
      language: json['Language'] == null
          ? null
          : UserLanguageModel.fromJson(
              json['Language'] as Map<String, dynamic>,
            ),
      landingPageFeature: json['LandingPageFeature'] == null
          ? null
          : UserLandingPageFeatureModel.fromJson(
              json['LandingPageFeature'] as Map<String, dynamic>,
            ),
      roles: (json['Roles'] as List<dynamic>?)
          ?.map((e) => UserRoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserListItemModelToJson(_UserListItemModel instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'MisUserId': instance.misUserId,
      'Name': instance.name,
      'Email': instance.email,
      'Designation': instance.designation,
      'ActiveStatus': instance.activeStatus,
      'FlgDashboardLandingPage': instance.flgDashboardLandingPage,
      'Archived': instance.archived,
      'PersonInfo': instance.personInfo,
      'Language': instance.language,
      'LandingPageFeature': instance.landingPageFeature,
      'Roles': instance.roles,
    };

_UserPersonInfoModel _$UserPersonInfoModelFromJson(Map<String, dynamic> json) =>
    _UserPersonInfoModel(
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      fullName: json['FullName'] as String?,
      gender: json['Gender'] as String?,
    );

Map<String, dynamic> _$UserPersonInfoModelToJson(
  _UserPersonInfoModel instance,
) => <String, dynamic>{
  'FirstName': instance.firstName,
  'LastName': instance.lastName,
  'FullName': instance.fullName,
  'Gender': instance.gender,
};

_UserLanguageModel _$UserLanguageModelFromJson(Map<String, dynamic> json) =>
    _UserLanguageModel(
      name: json['Name'] as String?,
      sysKey: json['SysKey'] as String?,
    );

Map<String, dynamic> _$UserLanguageModelToJson(_UserLanguageModel instance) =>
    <String, dynamic>{'Name': instance.name, 'SysKey': instance.sysKey};

_UserLandingPageFeatureModel _$UserLandingPageFeatureModelFromJson(
  Map<String, dynamic> json,
) => _UserLandingPageFeatureModel(
  name: json['Name'] as String?,
  shortName: json['ShortName'] as String?,
  sysKey: json['SysKey'] as String?,
);

Map<String, dynamic> _$UserLandingPageFeatureModelToJson(
  _UserLandingPageFeatureModel instance,
) => <String, dynamic>{
  'Name': instance.name,
  'ShortName': instance.shortName,
  'SysKey': instance.sysKey,
};

_UserRoleModel _$UserRoleModelFromJson(Map<String, dynamic> json) =>
    _UserRoleModel(
      roleId: (json['RoleId'] as num?)?.toInt(),
      roleName: json['RoleName'] as String?,
      roleKey: json['RoleKey'] as String?,
      branchName: json['BranchName'] as String?,
    );

Map<String, dynamic> _$UserRoleModelToJson(_UserRoleModel instance) =>
    <String, dynamic>{
      'RoleId': instance.roleId,
      'RoleName': instance.roleName,
      'RoleKey': instance.roleKey,
      'BranchName': instance.branchName,
    };
