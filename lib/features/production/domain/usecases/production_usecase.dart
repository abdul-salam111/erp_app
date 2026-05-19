import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/production_repository.dart';

class ProductionUsecase implements Usecase<dynamic, NoParams> {
  final ProductionRepository repository;

  ProductionUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
