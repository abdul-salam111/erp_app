import '../../../../core/shared/shared_exports.dart';
import '../../../../core/constants/const_exports.dart';

abstract interface class IRemotePurchaseOrderDataSource {
  // TODO: Define your datasource methods here
  Future<dynamic> performAction();
}

class RemotePurchaseOrderDataSourceImpl extends BaseRemoteDatasource
    implements IRemotePurchaseOrderDataSource {
  RemotePurchaseOrderDataSourceImpl({required super.dioHelper});

  @override
  Future<dynamic> performAction() async {
    return post(
      url: ApiEndPoints.purchaseOrder,
      parser: (json) => json, // TODO: Replace with your model parser
      body: {}, // TODO: Add your request body
    );
  }
}
