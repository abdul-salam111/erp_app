import 'package:equatable/equatable.dart';
import '../../../../../../core/constants/const_exports.dart';
import '../../../../domain/entities/system_entity.dart';

class NewUserState extends Equatable {
  final ApiStatus apiStatus;
  final String? message;
  final SystemUserDetailEntity? userDetail;
  final List<LandingPageFeatureEntity> landingPages;
  final List<RoleEntity> availableRoles;

  const NewUserState({
    this.apiStatus = ApiStatus.INITIAL,
    this.message,
    this.userDetail,
    this.landingPages = const [],
    this.availableRoles = const [],
  });

  NewUserState copyWith({
    ApiStatus? apiStatus,
    String? message,
    bool clearMessage = false,
    SystemUserDetailEntity? userDetail,
    List<LandingPageFeatureEntity>? landingPages,
    List<RoleEntity>? availableRoles,
  }) {
    return NewUserState(
      apiStatus: apiStatus ?? this.apiStatus,
      message: clearMessage ? null : (message ?? this.message),
      userDetail: userDetail ?? this.userDetail,
      landingPages: landingPages ?? this.landingPages,
      availableRoles: availableRoles ?? this.availableRoles,
    );
  }

  @override
  List<Object?> get props =>
      [apiStatus, message, userDetail, landingPages, availableRoles];
}
