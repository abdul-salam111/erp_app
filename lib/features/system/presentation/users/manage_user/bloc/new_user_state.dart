import 'package:equatable/equatable.dart';
import '../../../../../../core/constants/const_exports.dart';
import '../../../../domain/entities/system_entity.dart';

class NewUserState extends Equatable {
  final ApiStatus apiStatus;
  final ApiStatus saveStatus;
  final String? message;
  final SystemUserDetailEntity? userDetail;
  final List<LandingPageFeatureEntity> landingPages;
  final List<RoleEntity> availableRoles;
  final List<BranchEntity> branches;

  const NewUserState({
    this.apiStatus = ApiStatus.INITIAL,
    this.saveStatus = ApiStatus.INITIAL,
    this.message,
    this.userDetail,
    this.landingPages = const [],
    this.availableRoles = const [],
    this.branches = const [],
  });

  NewUserState copyWith({
    ApiStatus? apiStatus,
    ApiStatus? saveStatus,
    String? message,
    bool clearMessage = false,
    SystemUserDetailEntity? userDetail,
    List<LandingPageFeatureEntity>? landingPages,
    List<RoleEntity>? availableRoles,
    List<BranchEntity>? branches,
  }) {
    return NewUserState(
      apiStatus: apiStatus ?? this.apiStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      message: clearMessage ? null : (message ?? this.message),
      userDetail: userDetail ?? this.userDetail,
      landingPages: landingPages ?? this.landingPages,
      availableRoles: availableRoles ?? this.availableRoles,
      branches: branches ?? this.branches,
    );
  }

  @override
  List<Object?> get props => [
        apiStatus,
        saveStatus,
        message,
        userDetail,
        landingPages,
        availableRoles,
        branches,
      ];
}
