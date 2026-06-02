import 'package:fpdart/fpdart.dart';
import '../../../../core/shared/shared_exports.dart';
import '../entities/current_stock_entity.dart';
import '../entities/stock_received_entity.dart';

abstract interface class InventoryRepository {
  Future<Either<Failure, List<StockReceivedEntity>>> getStockReceived(String dateType);
  Future<Either<Failure, List<CurrentStockEntity>>> getCurrentStock();
}
