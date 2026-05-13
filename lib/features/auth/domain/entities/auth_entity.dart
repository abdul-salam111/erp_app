import '../../../../app_exports.dart';

class SigninEntity extends Equatable {
  final String id;
  final String token;

  const SigninEntity({required this.id, required this.token});

  @override
  List<Object> get props => [id, token];
}
