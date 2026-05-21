import 'package:freezed_annotation/freezed_annotation.dart';
part 'logged_in_user_model.freezed.dart';
part 'logged_in_user_model.g.dart';

@freezed
abstract class LoggedInUserModel with _$LoggedInUserModel {
    const factory LoggedInUserModel({
        @JsonKey(name: "MisUserId")
        int? misUserId,
        @JsonKey(name: "FirstName")
        String? firstName,
        @JsonKey(name: "LastName")
        String? lastName,
        @JsonKey(name: "Email")
        String? email,
        @JsonKey(name: "Language")
        Language? language,
        @JsonKey(name: "Organizations")
        List<Organization>? organizations,
    }) = _LoggedInUserModel;

    factory LoggedInUserModel.fromJson(Map<String, dynamic> json) => _$LoggedInUserModelFromJson(json);
}

@freezed
abstract class Language with _$Language {
    const factory Language({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "Id")
        int? id,
    }) = _Language;

    factory Language.fromJson(Map<String, dynamic> json) => _$LanguageFromJson(json);
}

@freezed
abstract class Organization with _$Organization {
    const factory Organization({
        @JsonKey(name: "Tenant")
        Tenant? tenant,
        @JsonKey(name: "Country")
        Country? country,
        @JsonKey(name: "Language")
        Language? language,
        @JsonKey(name: "Currency")
        Currency? currency,
        @JsonKey(name: "Product")
        Product? product,
        @JsonKey(name: "Branches")
        List<Branch>? branches,
        @JsonKey(name: "FlgImporting")
        bool? flgImporting,
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "MisTenantId")
        int? misTenantId,
        @JsonKey(name: "CountryId")
        int? countryId,
        @JsonKey(name: "CurrencyId")
        int? currencyId,
        @JsonKey(name: "LanguageId")
        int? languageId,
        @JsonKey(name: "ProductId")
        int? productId,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "Id")
        int? id,
    }) = _Organization;

    factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
}

@freezed
abstract class Branch with _$Branch {
    const factory Branch({
        @JsonKey(name: "AuthToken")
        AuthToken? authToken,
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "MisOrganizationId")
        int? misOrganizationId,
        @JsonKey(name: "LocationId")
        int? locationId,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "Id")
        int? id,
    }) = _Branch;

    factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);
}

@freezed
abstract class AuthToken with _$AuthToken {
    const factory AuthToken({
        @JsonKey(name: "AccessToken")
        String? accessToken,
        @JsonKey(name: "Expiration")
        DateTime? expiration,
        @JsonKey(name: "RefreshToken")
        String? refreshToken,
    }) = _AuthToken;

    factory AuthToken.fromJson(Map<String, dynamic> json) => _$AuthTokenFromJson(json);
}

@freezed
abstract class Country with _$Country {
    const factory Country({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "Iso3")
        String? iso3,
        @JsonKey(name: "Iso2")
        String? iso2,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "Id")
        int? id,
    }) = _Country;

    factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
}

@freezed
abstract class Currency with _$Currency {
    const factory Currency({
        @JsonKey(name: "Code")
        String? code,
        @JsonKey(name: "Symbol")
        String? symbol,
        @JsonKey(name: "Decimals")
        int? decimals,
        @JsonKey(name: "Id")
        int? id,
    }) = _Currency;

    factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
}

@freezed
abstract class Product with _$Product {
    const factory Product({
        @JsonKey(name: "Software")
        Software? software,
        @JsonKey(name: "SoftwareId")
        int? softwareId,
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "SysKey")
        String? sysKey,
        @JsonKey(name: "Archived")
        bool? archived,
        @JsonKey(name: "Id")
        int? id,
    }) = _Product;

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@freezed
abstract class Software with _$Software {
    const factory Software({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "SysKey")
        String? sysKey,
        @JsonKey(name: "Id")
        int? id,
    }) = _Software;

    factory Software.fromJson(Map<String, dynamic> json) => _$SoftwareFromJson(json);
}

@freezed
abstract class Tenant with _$Tenant {
    const factory Tenant({
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "DBId")
        int? dbId,
        @JsonKey(name: "Id")
        int? id,
    }) = _Tenant;

    factory Tenant.fromJson(Map<String, dynamic> json) => _$TenantFromJson(json);
}
