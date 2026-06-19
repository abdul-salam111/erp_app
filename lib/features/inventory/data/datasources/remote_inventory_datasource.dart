import '../../inventory_exports.dart';

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
