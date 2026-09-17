import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/system_entity.dart';

class RolesState extends Equatable {
  final List<RoleEntity>? roles;
  final String? message;
  final ApiStatus apiStatus;

  const RolesState({
    this.roles,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  RolesState copyWith({
    List<RoleEntity>? roles,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
  }) {
    return RolesState(
      roles: roles ?? this.roles,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [roles, message, apiStatus];
}
