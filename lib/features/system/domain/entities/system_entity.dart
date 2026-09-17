import 'package:equatable/equatable.dart';

class SystemUserEntity extends Equatable {
  final int id;
  final int? misUserId;
  final String name;
  final String email;
  final String designation;
  final String? activeStatus;
  final String? gender;
  final bool isArchived;
  final bool isDashboardLandingPage;
  final String? languageName;
  final String? landingPageName;
  final List<SystemUserRoleEntity> roles;

  const SystemUserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.designation,
    this.misUserId,
    this.activeStatus,
    this.gender,
    this.isArchived = false,
    this.isDashboardLandingPage = false,
    this.languageName,
    this.landingPageName,
    this.roles = const [],
  });

  @override
  List<Object?> get props => [
        id,
        misUserId,
        name,
        email,
        designation,
        activeStatus,
        gender,
        isArchived,
        isDashboardLandingPage,
        languageName,
        landingPageName,
        roles,
      ];
}

class SystemUserRoleEntity extends Equatable {
  final int? id;
  final int? roleId;
  final String name;
  final String? key;
  final String? branchName;
  final int? misBranchId;

  const SystemUserRoleEntity({
    required this.name,
    this.id,
    this.roleId,
    this.key,
    this.branchName,
    this.misBranchId,
  });

  @override
  List<Object?> get props => [id, roleId, name, key, branchName, misBranchId];
}

// ─── User detail (GetById) ────────────────────────────────────────────────

class SystemUserDetailEntity extends Equatable {
  final int id;
  final int? misUserId;
  final int? personId;
  final int? contactId;
  final String firstName;
  final String lastName;
  final String fullName;
  final String email;
  final String designation;
  final String? gender;
  final String? activeStatus;
  final int? languageId;
  final String? languageName;
  final int? landingPageFeatureId;
  final String? landingPageName;
  final bool isDashboardLandingPage;
  final bool isArchived;
  final int? openDaysPast;
  final int? openDaysFuture;
  final List<SystemUserRoleEntity> roles;
  final List<UserContactNumberEntity> contactNumbers;

  const SystemUserDetailEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.designation,
    this.misUserId,
    this.personId,
    this.contactId,
    this.gender,
    this.activeStatus,
    this.languageId,
    this.languageName,
    this.landingPageFeatureId,
    this.landingPageName,
    this.isDashboardLandingPage = false,
    this.isArchived = false,
    this.openDaysPast,
    this.openDaysFuture,
    this.roles = const [],
    this.contactNumbers = const [],
  });

  @override
  List<Object?> get props => [
        id,
        misUserId,
        personId,
        contactId,
        firstName,
        lastName,
        fullName,
        email,
        designation,
        gender,
        activeStatus,
        languageId,
        languageName,
        landingPageFeatureId,
        landingPageName,
        isDashboardLandingPage,
        isArchived,
        openDaysPast,
        openDaysFuture,
        roles,
        contactNumbers,
      ];
}

class UserContactNumberEntity extends Equatable {
  final int? id;
  final String? type;
  final String? international;
  final String? e164;
  final String? national;
  final String? regionCode;
  final String? countryCode;
  final bool isMobile;
  final bool isWork;
  final bool isWhatsApp;

  const UserContactNumberEntity({
    this.id,
    this.type,
    this.international,
    this.e164,
    this.national,
    this.regionCode,
    this.countryCode,
    this.isMobile = false,
    this.isWork = false,
    this.isWhatsApp = false,
  });

  @override
  List<Object?> get props => [
        id,
        type,
        international,
        e164,
        national,
        regionCode,
        countryCode,
        isMobile,
        isWork,
        isWhatsApp,
      ];
}

// ─── Landing page feature ─────────────────────────────────────────────────

class LandingPageFeatureEntity extends Equatable {
  final int id;
  final String name;
  final String? sysKey;
  final int? moduleId;
  final String? moduleName;

  const LandingPageFeatureEntity({
    required this.id,
    required this.name,
    this.sysKey,
    this.moduleId,
    this.moduleName,
  });

  @override
  List<Object?> get props => [id, name, sysKey, moduleId, moduleName];
}

// ─── Branch ───────────────────────────────────────────────────────────────

class BranchEntity extends Equatable {
  final int id;
  final String name;
  final int? organizationId;

  const BranchEntity({
    required this.id,
    required this.name,
    this.organizationId,
  });

  @override
  List<Object?> get props => [id, name, organizationId];
}

// ─── Role (definition list — separate from user's assigned role) ──────────

class RoleEntity extends Equatable {
  final int id;
  final String name;
  final String? sysKey;
  final String? description;
  final bool isSystemRole;
  final int totalUsers;
  final int? organizationId;

  const RoleEntity({
    required this.id,
    required this.name,
    this.sysKey,
    this.description,
    this.isSystemRole = false,
    this.totalUsers = 0,
    this.organizationId,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        sysKey,
        description,
        isSystemRole,
        totalUsers,
        organizationId,
      ];
}
