import '../../domain/entities/system_entity.dart';
import '../models/response_models/get_branches/branch_model.dart';
import '../models/response_models/get_landing_page_features/landing_page_feature_model.dart';
import '../models/response_models/get_roles/role_model.dart';
import '../models/response_models/get_user_by_id/user_detail_model.dart';
import '../models/response_models/get_users_list/user_list_item_model.dart';

// ─── Users list ────────────────────────────────────────────────────────────

extension UserListItemModelX on UserListItemModel {
  SystemUserEntity toEntity() => SystemUserEntity(
        id: id ?? 0,
        misUserId: misUserId,
        name: (name ?? personInfo?.fullName ?? '').trim(),
        email: email ?? '',
        designation: designation ?? '',
        activeStatus: activeStatus,
        gender: personInfo?.gender,
        isArchived: archived ?? false,
        isDashboardLandingPage: flgDashboardLandingPage ?? false,
        languageName: language?.name,
        landingPageName:
            landingPageFeature?.shortName ?? landingPageFeature?.name,
        roles: (roles ?? const [])
            .map((r) => r.toEntity())
            .where((r) => r.name.isNotEmpty)
            .toList(),
      );
}

extension UserRoleModelX on UserRoleModel {
  SystemUserRoleEntity toEntity() => SystemUserRoleEntity(
        roleId: roleId,
        name: roleName ?? '',
        key: roleKey,
        branchName: branchName,
      );
}

// ─── User detail (GetById) ─────────────────────────────────────────────────

extension UserDetailModelX on UserDetailModel {
  SystemUserDetailEntity toEntity() {
    final person = personInfo;
    final numbers = person?.contact?.numbers ?? const [];
    return SystemUserDetailEntity(
      id: id ?? 0,
      misUserId: misUserId,
      personId: person?.id ?? personId,
      contactId: person?.contact?.id,
      firstName: person?.firstName ?? '',
      lastName: person?.lastName ?? '',
      fullName: (person?.fullName ?? name ?? '').trim(),
      email: email ?? '',
      designation: designation ?? '',
      gender: person?.gender,
      activeStatus: activeStatus,
      languageId: language?.id,
      languageName: language?.name,
      landingPageFeatureId:
          landingPageFeatureId ?? landingPageFeature?.id,
      landingPageName: landingPageFeature?.name,
      isDashboardLandingPage: flgDashboardLandingPage ?? false,
      isArchived: archived ?? false,
      openDaysPast: openDaysPast,
      openDaysFuture: openDaysFuture,
      roles: (roles ?? const [])
          .map((r) => r.toEntity())
          .where((r) => r.name.isNotEmpty)
          .toList(),
      contactNumbers: numbers.map((n) => n.toEntity()).toList(),
    );
  }
}

extension UserDetailRoleModelX on UserDetailRoleModel {
  SystemUserRoleEntity toEntity() => SystemUserRoleEntity(
        id: id,
        roleId: roleId,
        name: roleName ?? '',
        key: roleKey,
        branchName: branchName,
        misBranchId: misBranchId,
      );
}

extension UserDetailContactNumberModelX on UserDetailContactNumberModel {
  UserContactNumberEntity toEntity() => UserContactNumberEntity(
        id: id,
        type: type,
        international: international,
        e164: e164,
        national: national,
        regionCode: regionCode,
        countryCode: countryCode,
        isMobile: flgMobile ?? false,
        isWork: flgWork ?? false,
        isWhatsApp: flgWhatsApp ?? false,
      );
}

// ─── Landing page features ────────────────────────────────────────────────

extension LandingPageFeatureModelX on LandingPageFeatureModel {
  LandingPageFeatureEntity toEntity() => LandingPageFeatureEntity(
        id: id ?? 0,
        name: name ?? '',
        sysKey: sysKey,
        moduleId: moduleId,
        moduleName: module?.name,
      );
}

// ─── Branches ─────────────────────────────────────────────────────────────

extension BranchModelX on BranchModel {
  BranchEntity toEntity() => BranchEntity(
        id: id ?? 0,
        name: name ?? '',
        organizationId: misOrganizationId,
      );
}

// ─── Roles ────────────────────────────────────────────────────────────────

extension RoleModelX on RoleModel {
  RoleEntity toEntity() => RoleEntity(
        id: id ?? 0,
        name: name ?? '',
        sysKey: sysKey,
        description: description,
        isSystemRole: flgSystem ?? false,
        totalUsers: totalUsers ?? 0,
        organizationId: misOrganizationId,
        isArchived: archived ?? false,
      );
}
