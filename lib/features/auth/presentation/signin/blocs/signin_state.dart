import 'package:equatable/equatable.dart';

import '../../../../../core/constants/const_exports.dart';
import '../../../auth_exports.dart';

class SignInState extends Equatable {
  final LoggedInUserModel? loggedInUser;
  final String? message;
  final ApiStatus apiStatus;
  final String email;
  final String password;

  const SignInState({
    this.loggedInUser,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.email = "",
    this.password = "",
  });

  SignInState copyWith({
    LoggedInUserModel? loggedInUser,
    String? message,
    ApiStatus? apiStatus,
    String? email,
    String? password,
  }) {
    return SignInState(
      loggedInUser: loggedInUser ?? this.loggedInUser,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props =>
      [loggedInUser, message, apiStatus, email, password];
}
