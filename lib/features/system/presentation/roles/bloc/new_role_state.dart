import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/system_entity.dart';

class NewRoleState extends Equatable {
  final ApiStatus apiStatus;
  final ApiStatus saveStatus;
  final String? message;
  final RoleEntity? role;

  const NewRoleState({
    this.apiStatus = ApiStatus.INITIAL,
    this.saveStatus = ApiStatus.INITIAL,
    this.message,
    this.role,
  });

  NewRoleState copyWith({
    ApiStatus? apiStatus,
    ApiStatus? saveStatus,
    String? message,
    bool clearMessage = false,
    RoleEntity? role,
  }) {
    return NewRoleState(
      apiStatus: apiStatus ?? this.apiStatus,
      saveStatus: saveStatus ?? this.saveStatus,
      message: clearMessage ? null : (message ?? this.message),
      role: role ?? this.role,
    );
  }

  @override
  List<Object?> get props => [apiStatus, saveStatus, message, role];
}
