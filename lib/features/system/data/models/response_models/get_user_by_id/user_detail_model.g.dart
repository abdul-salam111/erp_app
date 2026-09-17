// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    _UserDetailModel(
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
          : UserDetailPersonInfoModel.fromJson(
              json['PersonInfo'] as Map<String, dynamic>,
            ),
      language: json['Language'] == null
          ? null
          : UserDetailLanguageModel.fromJson(
              json['Language'] as Map<String, dynamic>,
            ),
      landingPageFeature: json['LandingPageFeature'] == null
          ? null
          : UserDetailLandingPageFeatureModel.fromJson(
              json['LandingPageFeature'] as Map<String, dynamic>,
            ),
      landingPageFeatureId: (json['LandingPageFeatureId'] as num?)?.toInt(),
      roles: (json['Roles'] as List<dynamic>?)
          ?.map((e) => UserDetailRoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDetailModelToJson(_UserDetailModel instance) =>
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
      'LandingPageFeatureId': instance.landingPageFeatureId,
      'Roles': instance.roles,
    };

_UserDetailPersonInfoModel _$UserDetailPersonInfoModelFromJson(
  Map<String, dynamic> json,
) => _UserDetailPersonInfoModel(
  firstName: json['FirstName'] as String?,
  lastName: json['LastName'] as String?,
  fullName: json['FullName'] as String?,
  gender: json['Gender'] as String?,
  contact: json['Contact'] == null
      ? null
      : UserDetailContactModel.fromJson(
          json['Contact'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$UserDetailPersonInfoModelToJson(
  _UserDetailPersonInfoModel instance,
) => <String, dynamic>{
  'FirstName': instance.firstName,
  'LastName': instance.lastName,
  'FullName': instance.fullName,
  'Gender': instance.gender,
  'Contact': instance.contact,
};

_UserDetailContactModel _$UserDetailContactModelFromJson(
  Map<String, dynamic> json,
) => _UserDetailContactModel(
  numbers: (json['Numbers'] as List<dynamic>?)
      ?.map(
        (e) => UserDetailContactNumberModel.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$UserDetailContactModelToJson(
  _UserDetailContactModel instance,
) => <String, dynamic>{'Numbers': instance.numbers};

_UserDetailContactNumberModel _$UserDetailContactNumberModelFromJson(
  Map<String, dynamic> json,
) => _UserDetailContactNumberModel(
  id: (json['Id'] as num?)?.toInt(),
  type: json['Type'] as String?,
  international: json['International'] as String?,
  e164: json['E164'] as String?,
  national: json['National'] as String?,
  regionCode: json['RegionCode'] as String?,
  countryCode: json['CountryCode'] as String?,
  flgMobile: json['FlgMobile'] as bool?,
  flgWork: json['FlgWork'] as bool?,
  flgWhatsApp: json['FlgWhatsApp'] as bool?,
);

Map<String, dynamic> _$UserDetailContactNumberModelToJson(
  _UserDetailContactNumberModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Type': instance.type,
  'International': instance.international,
  'E164': instance.e164,
  'National': instance.national,
  'RegionCode': instance.regionCode,
  'CountryCode': instance.countryCode,
  'FlgMobile': instance.flgMobile,
  'FlgWork': instance.flgWork,
  'FlgWhatsApp': instance.flgWhatsApp,
};

_UserDetailLanguageModel _$UserDetailLanguageModelFromJson(
  Map<String, dynamic> json,
) => _UserDetailLanguageModel(
  id: (json['Id'] as num?)?.toInt(),
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
);

Map<String, dynamic> _$UserDetailLanguageModelToJson(
  _UserDetailLanguageModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'SysKey': instance.sysKey,
};

_UserDetailLandingPageFeatureModel _$UserDetailLandingPageFeatureModelFromJson(
  Map<String, dynamic> json,
) => _UserDetailLandingPageFeatureModel(
  id: (json['Id'] as num?)?.toInt(),
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
);

Map<String, dynamic> _$UserDetailLandingPageFeatureModelToJson(
  _UserDetailLandingPageFeatureModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'Name': instance.name,
  'SysKey': instance.sysKey,
};

_UserDetailRoleModel _$UserDetailRoleModelFromJson(Map<String, dynamic> json) =>
    _UserDetailRoleModel(
      id: (json['Id'] as num?)?.toInt(),
      roleId: (json['RoleId'] as num?)?.toInt(),
      roleName: json['RoleName'] as String?,
      roleKey: json['RoleKey'] as String?,
      branchName: json['BranchName'] as String?,
      misBranchId: (json['MisBranchId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserDetailRoleModelToJson(
  _UserDetailRoleModel instance,
) => <String, dynamic>{
  'Id': instance.id,
  'RoleId': instance.roleId,
  'RoleName': instance.roleName,
  'RoleKey': instance.roleKey,
  'BranchName': instance.branchName,
  'MisBranchId': instance.misBranchId,
};
