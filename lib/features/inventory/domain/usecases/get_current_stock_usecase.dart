import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/current_stock_entity.dart';
import '../repositories/inventory_repository.dart';

class GetCurrentStockUsecase
    implements Usecase<List<CurrentStockEntity>, NoParams> {
  final InventoryRepository repository;

  GetCurrentStockUsecase({required this.repository});

  @override
  Future<Either<Failure, List<CurrentStockEntity>>> call(NoParams params) {
    return repository.getCurrentStock();
  }
}
