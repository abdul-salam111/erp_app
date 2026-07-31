// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoggedInUserModel _$LoggedInUserModelFromJson(Map<String, dynamic> json) =>
    _LoggedInUserModel(
      misUserId: (json['MisUserId'] as num?)?.toInt(),
      firstName: json['FirstName'] as String?,
      lastName: json['LastName'] as String?,
      organizations: (json['Organizations'] as List<dynamic>?)
          ?.map((e) => Organization.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoggedInUserModelToJson(_LoggedInUserModel instance) =>
    <String, dynamic>{
      'MisUserId': instance.misUserId,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Organizations': instance.organizations,
    };

_Organization _$OrganizationFromJson(Map<String, dynamic> json) =>
    _Organization(
      id: (json['Id'] as num?)?.toInt(),
      misTenantId: (json['MisTenantId'] as num?)?.toInt(),
      productId: (json['ProductId'] as num?)?.toInt(),
      name: json['Name'] as String?,
      branches: (json['Branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrganizationToJson(_Organization instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'MisTenantId': instance.misTenantId,
      'ProductId': instance.productId,
      'Name': instance.name,
      'Branches': instance.branches,
    };

_Branch _$BranchFromJson(Map<String, dynamic> json) => _Branch(
  id: (json['Id'] as num?)?.toInt(),
  authToken: json['AuthToken'] == null
      ? null
      : AuthToken.fromJson(json['AuthToken'] as Map<String, dynamic>),
  name: json['Name'] as String?,
);

Map<String, dynamic> _$BranchToJson(_Branch instance) => <String, dynamic>{
  'Id': instance.id,
  'AuthToken': instance.authToken,
  'Name': instance.name,
};

_AuthToken _$AuthTokenFromJson(Map<String, dynamic> json) => _AuthToken(
  accessToken: json['AccessToken'] as String?,
  expiration: json['Expiration'] == null
      ? null
      : DateTime.parse(json['Expiration'] as String),
  refreshToken: json['RefreshToken'] as String?,
);

Map<String, dynamic> _$AuthTokenToJson(_AuthToken instance) =>
    <String, dynamic>{
      'AccessToken': instance.accessToken,
      'Expiration': instance.expiration?.toIso8601String(),
      'RefreshToken': instance.refreshToken,
    };
