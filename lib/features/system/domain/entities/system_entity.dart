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
  final int? roleId;
  final String name;
  final String? key;
  final String? branchName;

  const SystemUserRoleEntity({
    required this.name,
    this.roleId,
    this.key,
    this.branchName,
  });

  @override
  List<Object?> get props => [roleId, name, key, branchName];
}
