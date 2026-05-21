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
      email: json['Email'] as String?,
      language: json['Language'] == null
          ? null
          : Language.fromJson(json['Language'] as Map<String, dynamic>),
      organizations: (json['Organizations'] as List<dynamic>?)
          ?.map((e) => Organization.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LoggedInUserModelToJson(_LoggedInUserModel instance) =>
    <String, dynamic>{
      'MisUserId': instance.misUserId,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Email': instance.email,
      'Language': instance.language,
      'Organizations': instance.organizations,
    };

_Language _$LanguageFromJson(Map<String, dynamic> json) =>
    _Language(name: json['Name'] as String?, id: (json['Id'] as num?)?.toInt());

Map<String, dynamic> _$LanguageToJson(_Language instance) => <String, dynamic>{
  'Name': instance.name,
  'Id': instance.id,
};

_Organization _$OrganizationFromJson(Map<String, dynamic> json) =>
    _Organization(
      tenant: json['Tenant'] == null
          ? null
          : Tenant.fromJson(json['Tenant'] as Map<String, dynamic>),
      country: json['Country'] == null
          ? null
          : Country.fromJson(json['Country'] as Map<String, dynamic>),
      language: json['Language'] == null
          ? null
          : Language.fromJson(json['Language'] as Map<String, dynamic>),
      currency: json['Currency'] == null
          ? null
          : Currency.fromJson(json['Currency'] as Map<String, dynamic>),
      product: json['Product'] == null
          ? null
          : Product.fromJson(json['Product'] as Map<String, dynamic>),
      branches: (json['Branches'] as List<dynamic>?)
          ?.map((e) => Branch.fromJson(e as Map<String, dynamic>))
          .toList(),
      flgImporting: json['FlgImporting'] as bool?,
      name: json['Name'] as String?,
      misTenantId: (json['MisTenantId'] as num?)?.toInt(),
      countryId: (json['CountryId'] as num?)?.toInt(),
      currencyId: (json['CurrencyId'] as num?)?.toInt(),
      languageId: (json['LanguageId'] as num?)?.toInt(),
      productId: (json['ProductId'] as num?)?.toInt(),
      archived: json['Archived'] as bool?,
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrganizationToJson(_Organization instance) =>
    <String, dynamic>{
      'Tenant': instance.tenant,
      'Country': instance.country,
      'Language': instance.language,
      'Currency': instance.currency,
      'Product': instance.product,
      'Branches': instance.branches,
      'FlgImporting': instance.flgImporting,
      'Name': instance.name,
      'MisTenantId': instance.misTenantId,
      'CountryId': instance.countryId,
      'CurrencyId': instance.currencyId,
      'LanguageId': instance.languageId,
      'ProductId': instance.productId,
      'Archived': instance.archived,
      'Id': instance.id,
    };

_Branch _$BranchFromJson(Map<String, dynamic> json) => _Branch(
  authToken: json['AuthToken'] == null
      ? null
      : AuthToken.fromJson(json['AuthToken'] as Map<String, dynamic>),
  name: json['Name'] as String?,
  misOrganizationId: (json['MisOrganizationId'] as num?)?.toInt(),
  locationId: (json['LocationId'] as num?)?.toInt(),
  archived: json['Archived'] as bool?,
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$BranchToJson(_Branch instance) => <String, dynamic>{
  'AuthToken': instance.authToken,
  'Name': instance.name,
  'MisOrganizationId': instance.misOrganizationId,
  'LocationId': instance.locationId,
  'Archived': instance.archived,
  'Id': instance.id,
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

_Country _$CountryFromJson(Map<String, dynamic> json) => _Country(
  name: json['Name'] as String?,
  iso3: json['Iso3'] as String?,
  iso2: json['Iso2'] as String?,
  archived: json['Archived'] as bool?,
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CountryToJson(_Country instance) => <String, dynamic>{
  'Name': instance.name,
  'Iso3': instance.iso3,
  'Iso2': instance.iso2,
  'Archived': instance.archived,
  'Id': instance.id,
};

_Currency _$CurrencyFromJson(Map<String, dynamic> json) => _Currency(
  code: json['Code'] as String?,
  symbol: json['Symbol'] as String?,
  decimals: (json['Decimals'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$CurrencyToJson(_Currency instance) => <String, dynamic>{
  'Code': instance.code,
  'Symbol': instance.symbol,
  'Decimals': instance.decimals,
  'Id': instance.id,
};

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  software: json['Software'] == null
      ? null
      : Software.fromJson(json['Software'] as Map<String, dynamic>),
  softwareId: (json['SoftwareId'] as num?)?.toInt(),
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  archived: json['Archived'] as bool?,
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'Software': instance.software,
  'SoftwareId': instance.softwareId,
  'Name': instance.name,
  'SysKey': instance.sysKey,
  'Archived': instance.archived,
  'Id': instance.id,
};

_Software _$SoftwareFromJson(Map<String, dynamic> json) => _Software(
  name: json['Name'] as String?,
  sysKey: json['SysKey'] as String?,
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$SoftwareToJson(_Software instance) => <String, dynamic>{
  'Name': instance.name,
  'SysKey': instance.sysKey,
  'Id': instance.id,
};

_Tenant _$TenantFromJson(Map<String, dynamic> json) => _Tenant(
  name: json['Name'] as String?,
  dbId: (json['DBId'] as num?)?.toInt(),
  id: (json['Id'] as num?)?.toInt(),
);

Map<String, dynamic> _$TenantToJson(_Tenant instance) => <String, dynamic>{
  'Name': instance.name,
  'DBId': instance.dbId,
  'Id': instance.id,
};
