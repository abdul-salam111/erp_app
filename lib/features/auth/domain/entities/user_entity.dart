import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? languageName;
  final List<UserOrganizationEntity> organizations;
  // TODO: wire isAdmin and roles to API response fields when the API adds them
  final bool isAdmin;
  final List<String> roles;

  const UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.languageName,
    this.organizations = const [],
    this.isAdmin = true,
    this.roles = const [],
  });

  String get fullName => '${firstName ?? ''} ${lastName ?? ''}'.trim();

  Map<String, dynamic> toJson() => {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'languageName': languageName,
        'organizations': organizations.map((o) => o.toJson()).toList(),
        'isAdmin': isAdmin,
        'roles': roles,
      };

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json['id'] as int?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        email: json['email'] as String?,
        languageName: json['languageName'] as String?,
        organizations: (json['organizations'] as List<dynamic>? ?? [])
            .map((o) =>
                UserOrganizationEntity.fromJson(o as Map<String, dynamic>))
            .toList(),
        isAdmin: json['isAdmin'] as bool? ?? false,
        roles: (json['roles'] as List<dynamic>? ?? [])
            .map((r) => r as String)
            .toList(),
      );

  @override
  List<Object?> get props =>
      [id, firstName, lastName, email, languageName, organizations, isAdmin, roles];
}

class UserOrganizationEntity extends Equatable {
  final int? id;
  final String? name;
  final String? tenantName;
  final String? productName;
  final String? countryName;
  final String? countryIso2;
  final String? currencyCode;
  final String? currencySymbol;
  final int? currencyDecimals;
  final List<UserBranchEntity> branches;

  const UserOrganizationEntity({
    this.id,
    this.name,
    this.tenantName,
    this.productName,
    this.countryName,
    this.countryIso2,
    this.currencyCode,
    this.currencySymbol,
    this.currencyDecimals,
    this.branches = const [],
  });

  String? get activeAccessToken => branches.firstOrNull?.accessToken;

  UserBranchEntity? get activeBranch => branches.firstOrNull;

  /// Returns a copy with the active (first) branch's session fields replaced —
  /// used after login/SelectBranch/refresh to persist the latest token data.
  UserOrganizationEntity withUpdatedActiveBranchToken({
    required String? accessToken,
    required String? refreshToken,
    required DateTime? tokenExpiration,
  }) {
    if (branches.isEmpty) return this;
    final updatedBranches = [
      branches.first.copyWith(
        accessToken: accessToken,
        refreshToken: refreshToken,
        tokenExpiration: tokenExpiration,
      ),
      ...branches.skip(1),
    ];
    return UserOrganizationEntity(
      id: id,
      name: name,
      tenantName: tenantName,
      productName: productName,
      countryName: countryName,
      countryIso2: countryIso2,
      currencyCode: currencyCode,
      currencySymbol: currencySymbol,
      currencyDecimals: currencyDecimals,
      branches: updatedBranches,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tenantName': tenantName,
        'productName': productName,
        'countryName': countryName,
        'countryIso2': countryIso2,
        'currencyCode': currencyCode,
        'currencySymbol': currencySymbol,
        'currencyDecimals': currencyDecimals,
        'branches': branches.map((b) => b.toJson()).toList(),
      };

  factory UserOrganizationEntity.fromJson(Map<String, dynamic> json) =>
      UserOrganizationEntity(
        id: json['id'] as int?,
        name: json['name'] as String?,
        tenantName: json['tenantName'] as String?,
        productName: json['productName'] as String?,
        countryName: json['countryName'] as String?,
        countryIso2: json['countryIso2'] as String?,
        currencyCode: json['currencyCode'] as String?,
        currencySymbol: json['currencySymbol'] as String?,
        currencyDecimals: json['currencyDecimals'] as int?,
        branches: (json['branches'] as List<dynamic>? ?? [])
            .map((b) => UserBranchEntity.fromJson(b as Map<String, dynamic>))
            .toList(),
      );

  @override
  List<Object?> get props => [
        id,
        name,
        tenantName,
        productName,
        countryName,
        countryIso2,
        currencyCode,
        currencySymbol,
        currencyDecimals,
        branches,
      ];
}

class UserBranchEntity extends Equatable {
  final int? id;
  final String? name;
  final String? accessToken;
  final String? refreshToken;
  final DateTime? tokenExpiration;

  const UserBranchEntity({
    this.id,
    this.name,
    this.accessToken,
    this.refreshToken,
    this.tokenExpiration,
  });

  bool get isTokenExpired =>
      tokenExpiration != null && tokenExpiration!.isBefore(DateTime.now());

  UserBranchEntity copyWith({
    String? accessToken,
    String? refreshToken,
    DateTime? tokenExpiration,
  }) =>
      UserBranchEntity(
        id: id,
        name: name,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        tokenExpiration: tokenExpiration ?? this.tokenExpiration,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'tokenExpiration': tokenExpiration?.toIso8601String(),
      };

  factory UserBranchEntity.fromJson(Map<String, dynamic> json) =>
      UserBranchEntity(
        id: json['id'] as int?,
        name: json['name'] as String?,
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        tokenExpiration: json['tokenExpiration'] != null
            ? DateTime.tryParse(json['tokenExpiration'] as String)
            : null,
      );

  @override
  List<Object?> get props =>
      [id, name, accessToken, refreshToken, tokenExpiration];
}
