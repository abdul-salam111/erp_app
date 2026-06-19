
import '../../inventory_exports.dart';

abstract interface class IRemoteInventoryDataSource {
  Future<List<StockRecievedModel>> getStockReceived(String dateType);
  Future<List<CurrentStockModel>> getCurrentStock();
}
