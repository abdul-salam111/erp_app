import '../../domain/entities/system_entity.dart';
import '../models/response_models/get_users_list/user_list_item_model.dart';

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
