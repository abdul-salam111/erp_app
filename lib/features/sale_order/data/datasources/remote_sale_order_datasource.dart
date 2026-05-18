import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemoteSaleOrderDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemoteSaleOrderDataSourceImpl extends BaseRemoteDatasource
    implements IRemoteSaleOrderDataSource {
  RemoteSaleOrderDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.saleOrder,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
