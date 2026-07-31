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
        @JsonKey(name: "Organizations")
        List<Organization>? organizations,
    }) = _LoggedInUserModel;

    factory LoggedInUserModel.fromJson(Map<String, dynamic> json) => _$LoggedInUserModelFromJson(json);
}

@freezed
abstract class Organization with _$Organization {
    const factory Organization({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "MisTenantId")
        int? misTenantId,
        @JsonKey(name: "ProductId")
        int? productId,
        @JsonKey(name: "Name")
        String? name,
        @JsonKey(name: "Branches")
        List<Branch>? branches,
    }) = _Organization;

    factory Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);
}

@freezed
abstract class Branch with _$Branch {
    const factory Branch({
        @JsonKey(name: "Id")
        int? id,
        @JsonKey(name: "AuthToken")
        AuthToken? authToken,
        @JsonKey(name: "Name")
        String? name,
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
