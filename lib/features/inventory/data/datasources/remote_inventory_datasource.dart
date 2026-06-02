import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';
import '../../../../core/services/session_manager.dart';
import '../models/response_models/get_current_stock/current_stock_model.dart';
import '../models/response_models/get_stock_recieved/stock_recieved_model.dart';

abstract interface class IRemoteInventoryDataSource {
  Future<List<StockRecievedModel>> getStockReceived(String dateType);
  Future<List<CurrentStockModel>> getCurrentStock();
}

class RemoteInventoryDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteInventoryDataSource {
  RemoteInventoryDataSourceImpl({required super.dioHelper});

  String? get _token => SessionController.instance.activeAccessToken;

  @override
  Future<List<StockRecievedModel>> getStockReceived(String dateType) async {
    return postList(
      url: ApiEndPoints.getStockReceived,
      body: {'DateType': dateType},
      parser: (json) => StockRecievedModel.fromJson(json),
      authToken: _token,
    );
  }

  @override
  Future<List<CurrentStockModel>> getCurrentStock() async {
    return postList(
      url: ApiEndPoints.getCurrentStock,
      body: {},
      parser: (json) => CurrentStockModel.fromJson(json),
      authToken: _token,
    );
  }
}
