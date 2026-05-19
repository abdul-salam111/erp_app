import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/security_repository.dart';

class SecurityUsecase implements Usecase<dynamic, NoParams> {
  final SecurityRepository repository;

  SecurityUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
