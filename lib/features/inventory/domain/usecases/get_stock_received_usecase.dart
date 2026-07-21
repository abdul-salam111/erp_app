import '../../../../core/shared/shared_exports.dart';
import '../../../../core/utils/result.dart';
import '../entities/stock_received_entity.dart';
import '../repositories/inventory_repository.dart';

class StockReceivedParams {
  final String dateType;
  const StockReceivedParams({this.dateType = 'today'});
}

class GetStockReceivedUsecase
    implements Usecase<List<StockReceivedEntity>, StockReceivedParams> {
  final InventoryRepository repository;

  GetStockReceivedUsecase({required this.repository});

  @override
  Future<Result<List<StockReceivedEntity>>> call(
    StockReceivedParams params,
  ) {
    return repository.getStockReceived(params.dateType);
  }
}
