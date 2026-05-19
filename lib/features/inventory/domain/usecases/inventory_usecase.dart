import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../repositories/inventory_repository.dart';

class InventoryUsecase implements Usecase<dynamic, NoParams> {
  final InventoryRepository repository;

  InventoryUsecase({required this.repository});

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return repository.performAction();
  }
}
