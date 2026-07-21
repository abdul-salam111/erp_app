import '../../../../core/utils/result.dart';
import '../entities/current_stock_entity.dart';
import '../entities/stock_received_entity.dart';

abstract interface class InventoryRepository {
  Future<Result<List<StockReceivedEntity>>> getStockReceived(String dateType);
  Future<Result<List<CurrentStockEntity>>> getCurrentStock();
}
