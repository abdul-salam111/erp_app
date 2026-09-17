import 'package:equatable/equatable.dart';
import '../../../../../../core/constants/const_exports.dart';
import '../../../../domain/entities/system_entity.dart';

class UsersState extends Equatable {
  final List<SystemUserEntity>? users;
  final String? message;
  final ApiStatus apiStatus;
  final ApiStatus deleteStatus;
  final int? deletingId;

  const UsersState({
    this.users,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.deleteStatus = ApiStatus.INITIAL,
    this.deletingId,
  });

  UsersState copyWith({
    List<SystemUserEntity>? users,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
    ApiStatus? deleteStatus,
    int? deletingId,
    bool clearDeletingId = false,
  }) {
    return UsersState(
      users: users ?? this.users,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
      deleteStatus: deleteStatus ?? this.deleteStatus,
      deletingId: clearDeletingId ? null : (deletingId ?? this.deletingId),
    );
  }

  @override
  List<Object?> get props =>
      [users, message, apiStatus, deleteStatus, deletingId];
}
