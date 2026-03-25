import '../../../../../app_exports.dart';

class SignInState extends Equatable {
  final UserToken? userToken;
  final String? message;
  final ApiStatus apiStatus;

  final String email;
  final String password;
  const SignInState({
    this.userToken,
    this.message,
    this.apiStatus = ApiStatus.initial,
    this.email = "",
    this.password = "",
  });

  //copy with method
  SignInState copyWith({
    UserToken? userToken,
    String? message,
    ApiStatus? apiStatus,
    String? email,
    String? password,
  }) {
    return SignInState(
      userToken: userToken ?? this.userToken,
      message: message ?? this.message,
      apiStatus: apiStatus ?? this.apiStatus,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [userToken, message, apiStatus, email, password];
}
