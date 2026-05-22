import 'package:equatable/equatable.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../auth_exports.dart';

class SignInState extends Equatable {
  final UserEntity? user;
  final String? message;
  final ApiStatus apiStatus;
  final String email;
  final String password;

  const SignInState({
    this.user,
    this.message,
    this.apiStatus = ApiStatus.INITIAL,
    this.email = '',
    this.password = '',
  });

  SignInState copyWith({
    UserEntity? user,
    String? message,
    ApiStatus? apiStatus,
    String? email,
    String? password,
  }) {
    return SignInState(
      user: user ?? this.user,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [user, message, apiStatus, email, password];
}
