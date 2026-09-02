import 'package:equatable/equatable.dart';

import '../../../../core/constants/app_enums.dart';

class ProfileState extends Equatable {
  final dynamic data;
  final String? message;
  final ApiStatus apiStatus;
  final ApiStatus logoutStatus;

  const ProfileState({
    this.data,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.logoutStatus = ApiStatus.INITIAL,
  });

  ProfileState copyWith({
    dynamic data,
    String? message,
    bool clearMessage = false,
    ApiStatus? apiStatus,
    ApiStatus? logoutStatus,
  }) {
    return ProfileState(
      data: data ?? this.data,
      message: clearMessage ? null : (message ?? this.message),
      apiStatus: apiStatus ?? this.apiStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
    );
  }

  @override
  List<Object?> get props => [data, message, apiStatus, logoutStatus];
}
