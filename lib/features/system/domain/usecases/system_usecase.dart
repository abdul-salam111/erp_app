import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/system_repository.dart';

class SystemUsecase implements Usecase<dynamic, NoParams> {
  final SystemRepository repository;

  SystemUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
