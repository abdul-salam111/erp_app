import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../domain/entities/system_entity.dart';

class UsersState extends Equatable {
  final List<SystemUserEntity>? users;
  final String? message;
  final ApiStatus apiStatus;

  const UsersState({
    this.users,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
  });

  UsersState copyWith({
    List<SystemUserEntity>? users,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
  }) {
    return UsersState(
      users: users ?? this.users,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
    );
  }

  @override
  List<Object?> get props => [users, message, apiStatus];
}
