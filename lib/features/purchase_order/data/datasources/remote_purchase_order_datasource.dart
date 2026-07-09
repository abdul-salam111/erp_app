import '../../../../core/shared/shared_exports.dart';
import '../../domain/entities/purchase_order_entity.dart';

abstract interface class IRemotePurchaseOrderDataSource {
  Future<List<PurchaseOrderEntity>> fetchOrders({
    required String fromDate,
    required String toDate,
    String? search,
  });
  Future<dynamic> createPurchaseOrder();
}

class RemotePurchaseOrderDataSourceImpl 
extends BaseRemoteDatasource
    implements IRemotePurchaseOrderDataSource {
  RemotePurchaseOrderDataSourceImpl({required super.dioHelper});

  @override
  Future<List<PurchaseOrderEntity>> fetchOrders({
    required String fromDate,
    required String toDate,
    String? search,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    return _mockOrders;
  }

  static const _mockOrders = [
    PurchaseOrderEntity(docNumber: 'PO-0011', partyName: '42-504 - Punjab Iron and Pipe Store', date: '02/06/26', netAmount: 200000, refNo: '1122', rowsCount: 2, remarks: '100% Broken Rice'),
    PurchaseOrderEntity(docNumber: 'PO-0010', partyName: 'Abbas Labour Contractor', date: '11/05/26', netAmount: 20000, refNo: null, rowsCount: 1, remarks: '100% Broken Rice'),
    PurchaseOrderEntity(docNumber: 'PO-0009', partyName: '42-504 - Punjab Iron and Pipe Store', date: '11/05/26', netAmount: 100000, refNo: null, rowsCount: 1, remarks: '100% Broken Rice'),
    PurchaseOrderEntity(docNumber: 'PO-0008', partyName: 'Test', date: '08/05/26', netAmount: 1000000, refNo: null, rowsCount: 1, remarks: 'Raw Maize'),
    PurchaseOrderEntity(docNumber: 'PO-0007', partyName: '42-504 - Punjab Iron and Pipe Store', date: '08/05/26', netAmount: 200000, refNo: null, rowsCount: 2, remarks: '100% Broken Rice'),
    PurchaseOrderEntity(docNumber: 'PO-0006', partyName: 'abc', date: '08/05/26', netAmount: 1000000, refNo: null, rowsCount: 1, remarks: 'Basmati Rice'),
    PurchaseOrderEntity(docNumber: 'PO-0005', partyName: 'Abbas Labour Contractor', date: '20/02/26', netAmount: 100000, refNo: null, rowsCount: 2, remarks: 'B3 Corn Grits'),
    PurchaseOrderEntity(docNumber: 'PO-0004', partyName: '42-504 - Punjab Iron and Pipe Store', date: '20/02/26', netAmount: 50000, refNo: null, rowsCount: 1, remarks: 'Corn Meal Medium'),
    PurchaseOrderEntity(docNumber: 'PO-0003', partyName: '42-504 - Punjab Iron and Pipe Store', date: '28/01/26', netAmount: 138500, refNo: null, rowsCount: 3, remarks: 'Corn Meal Medium'),
    PurchaseOrderEntity(docNumber: 'PO-0002', partyName: 'Ayub Commission Shop Renala', date: '01/07/25', netAmount: 88687.50, refNo: '2', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
    PurchaseOrderEntity(docNumber: 'PO-0001', partyName: 'Muzammil Hussain Commission Shop', date: '01/07/25', netAmount: 1077750, refNo: '1', rowsCount: 1, remarks: 'RM Yellow Corn'),
  ];

  @override
  Future<dynamic> createPurchaseOrder() async {
    // TODO: implement createPurchaseOrder API call
    throw UnimplementedError('createPurchaseOrder not implemented');
  }
}
