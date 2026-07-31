import '../../../../domain/entities/user_entity.dart';
import 'logged_in_user_model.dart';

extension LoggedInUserModelMapper on LoggedInUserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: misUserId,
      firstName: firstName,
      lastName: lastName,
      organizations:
          organizations?.map((o) => o.toEntity()).toList() ?? const [],
      isAdmin: false,
      roles: const [],
    );
  }
}

extension OrganizationMapper on Organization {
  UserOrganizationEntity toEntity() {
    return UserOrganizationEntity(
      id: id,
      name: name,
      branches: branches?.map((b) => b.toEntity()).toList() ?? const [],
    );
  }
}

extension BranchMapper on Branch {
  UserBranchEntity toEntity() {
    return UserBranchEntity(
      id: id,
      name: name,
      accessToken: authToken?.accessToken,
      refreshToken: authToken?.refreshToken,
      tokenExpiration: authToken?.expiration,
    );
  }
}
