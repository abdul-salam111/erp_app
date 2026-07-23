import '../../../../domain/entities/user_entity.dart';
import 'logged_in_user_model.dart';

extension LoggedInUserModelMapper on LoggedInUserModel {
  UserEntity toEntity() {
    return UserEntity(
      id: misUserId,
      firstName: firstName,
      lastName: lastName,
      email: email,
      languageName: language?.name,
      organizations:
          organizations?.map((o) => o.toEntity()).toList() ?? const [],
      // TODO: replace placeholders once API returns isAdmin and roles fields
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
      tenantName: tenant?.name,
      productName: product?.name,
      countryName: country?.name,
      countryIso2: country?.iso2,
      currencyCode: currency?.code,
      currencySymbol: currency?.symbol,
      currencyDecimals: currency?.decimals,
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
